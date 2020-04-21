$(function() {
	var row = $("#row").val();
	$('.hebing').each(function(index, element) {

				if (!$(this).hasClass('hide'))
					debugger;
				{
					var next = $(this).parent('tr').next('tr')
							.children('.hebing');// 下一个合并的对象

					$(this).attr('rowspan', 1);
					debugger;

					while ($(this).text() == next.text())

					{

						$(this).attr('rowspan',
								parseInt($(this).attr('rowspan')) + 1);

						next.hide();

						next.addClass('hide');

						next = next.parent('tr').next('tr').children('.hebing');// 下一个合并的对象

					}

				}

			});

	$('.hebing0').each(function(index, element) {

				if (!$(this).hasClass('hide'))
					debugger;
				{
					var next = $(this).parent('tr').next('tr')
							.children('.hebing0');// 下一个合并的对象

					$(this).attr('rowspan', 1);
					debugger;

					while ($(this).text() == next.text())

					{

						$(this).attr('rowspan',
								parseInt($(this).attr('rowspan')) + 1);

						next.hide();

						next.addClass('hide');

						next = next.parent('tr').next('tr')
								.children('.hebing0');// 下一个合并的对象

					}

				}

			});

	$('.hebing1').each(function(index, element) {

				if (!$(this).hasClass('hide'))
					debugger;
				{
					var next = $(this).parent('tr').next('tr')
							.children('.hebing1');// 下一个合并的对象

					$(this).attr('rowspan', row);
					debugger;

					while ($(this).text() == next.text())

					{

						$(this).attr('rowspan',
								parseInt($(this).attr('rowspan')) + 0);

						next.hide();

						next.addClass('hide');

						next = next.parent('tr').next('tr')
								.children('.hebing1');// 下一个合并的对象

					}

				}

			});

	$('.hebing2').each(function(index, element) {

				if (!$(this).hasClass('hide'))
					debugger;
				{
					var next = $(this).parent('tr').next('tr')
							.children('.hebing2');// 下一个合并的对象

					$(this).attr('rowspan', row);
					debugger;

					while ($(this).text() == next.text())

					{

						$(this).attr('rowspan',
								parseInt($(this).attr('rowspan')) + 0);

						next.hide();

						next.addClass('hide');

						next = next.parent('tr').next('tr')
								.children('.hebing2');// 下一个合并的对象

					}

				}

			});

	$('.hebing3').each(function(index, element) {

				if (!$(this).hasClass('hide'))
					debugger;
				{
					var next = $(this).parent('tr').next('tr')
							.children('.hebing3');// 下一个合并的对象

					$(this).attr('rowspan', row);
					debugger;

					while ($(this).text() == next.text())

					{

						$(this).attr('rowspan',
								parseInt($(this).attr('rowspan')) + 0);

						next.hide();

						next.addClass('hide');

						next = next.parent('tr').next('tr')
								.children('.hebing3');// 下一个合并的对象

					}

				}

			});

	$('.hebing4').each(function(index, element) {

				if (!$(this).hasClass('hide'))
					debugger;
				{
					var next = $(this).parent('tr').next('tr')
							.children('.hebing4');// 下一个合并的对象

					$(this).attr('rowspan', row);
					debugger;

					while ($(this).text() == next.text())

					{

						$(this).attr('rowspan',
								parseInt($(this).attr('rowspan')) + 0);

						next.hide();

						next.addClass('hide');

						next = next.parent('tr').next('tr')
								.children('.hebing4');// 下一个合并的对象

					}

				}

			});

	$('.hebing5').each(function(index, element) {

				if (!$(this).hasClass('hide'))
					debugger;
				{
					var next = $(this).parent('tr').next('tr')
							.children('.hebing5');// 下一个合并的对象

					$(this).attr('rowspan', 1);
					debugger;

					while ($(this).text() == next.text())

					{

						$(this).attr('rowspan',
								parseInt($(this).attr('rowspan')) + 1);

						next.hide();

						next.addClass('hide');

						next = next.parent('tr').next('tr')
								.children('.hebing5');// 下一个合并的对象

					}

				}

			});
	$('.hebing6').each(function(index, element) {

				if (!$(this).hasClass('hide'))
					debugger;
				{
					var next = $(this).parent('tr').next('tr')
							.children('.hebing6');// 下一个合并的对象

					$(this).attr('rowspan', 1);
					debugger;

					while ($(this).text() == next.text())

					{

						$(this).attr('rowspan',
								parseInt($(this).attr('rowspan')) + 1);

						next.hide();

						next.addClass('hide');

						next = next.parent('tr').next('tr')
								.children('.hebing6');// 下一个合并的对象

					}

				}

			});
});
