//request.js
import axios from "axios";
import qs from "qs";
import app from "../main.js";
/****** 创建axios实例 ******/
const service = axios.create({
  baseURL: process.env.BASE_URL,  // api的base_url
  timeout: 5000  // 请求超时时间
});
let loading;
startLoading() {    //使用Element loading-start 方法
  loading = Loading.service({
    lock: true,
    text: '加载中……',
    background: 'rgba(0, 0, 0, 0.7)'
  })
}
function endLoading() {    //使用Element loading-close 方法
  loading.close()
}
//那么 showFullScreenLoading() tryHideFullScreenLoading() 要干的事儿就是将同一时刻的请求合并。
//声明一个变量 needLoadingRequestCount，每次调用showFullScreenLoading方法 needLoadingRequestCount + 1。
//调用tryHideFullScreenLoading()方法，needLoadingRequestCount - 1。needLoadingRequestCount为 0 时，结束 loading。
let needLoadingRequestCount = 0
export function showFullScreenLoading() {
  if (needLoadingRequestCount === 0) {
    startLoading()
  }
  needLoadingRequestCount++
}

export function tryHideFullScreenLoading() {
  if (needLoadingRequestCount <= 0) return
  needLoadingRequestCount--
  if (needLoadingRequestCount === 0) {
    endLoading()
  }
}
/****** request拦截器==>对请求参数做处理 ******/
service.interceptors.request.use(config => {
  // app.$vux.loading.show({
  //   text: '数据加载中……'
  // });

  config.method === 'post'
    ? config.data = qs.stringify({...config.data})
    : config.params = {...config.params};
  config.headers['Content-Type'] = 'application/x-www-form-urlencoded';
  showFullScreenLoading()
  return config;
}, error => {  //请求错误处理
  app.$vux.toast.show({
    type: 'warn',
    text: error
  });
  Promise.reject(error)
});
/****** respone拦截器==>对响应做处理 ******/
service.interceptors.response.use(
  response => {  //成功请求到数据
    // app.$vux.loading.hide();
    tryHideFullScreenLoading()
    //这里根据后端提供的数据进行对应的处理
    if (response.data.result === 'TRUE') {
      return response.data;
    } else {
      app.$vux.toast.show({  //常规错误处理
        type: 'warn',
        text: response.data.data.msg
      });
    }
  },
  error => {  //响应错误处理
    console.log('error');
    console.log(error);
    console.log(JSON.stringify(error));

    let text = JSON.parse(JSON.stringify(error)).response.status === 404
      ? '404'
      : '网络异常，请重试';
    app.$vux.toast.show({
      type: 'warn',
      text: text
    });

    return Promise.reject(error)
  }
);
