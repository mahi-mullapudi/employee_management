$(document).ready(function () {
    adjustBar();
    $(window).on('resize', function () {
        adjustBar();
    })
    $('#height').on('input change', function () {
        var height = $(this).val();
        if (height >= 30) {
            var leftOffset = (Math.tan(45 * (Math.PI / 180)) * (height / 2) + 3) * -1;
            $('.steps').css('height', height).css('line-height', height + "px").css('left', leftOffset + "px");
            adjustBar();
        }
    });
});

function adjustBar() {
    var items = $('.steps').length;
    var elHeight = $('.steps').height() / 2; //Division by 2 because each pseudo which is skewed is only 50% of its parent.
    var skewOffset = Math.tan(45 * (Math.PI / 180)) * elHeight;
    var reduction = skewOffset + ((items - 1) * 4);
    if ($('.steps').css('left') !== undefined) {
        var leftOffset = $('.steps').css('left').replace('px', '');
        var factor = leftOffset * (-1) - 2;
        $('.steps').css({
            'width': '-webkit-calc((100% + 4px - ' + reduction + 'px)/' + items + ')',
            'width': 'calc((100% + 4px - ' + reduction + 'px)/' + items + ')'
        }); // 4px for borders on either side
        $('.steps:first-child, .steps:last-child').css({
            'width': '-webkit-calc((100% + 4px - ' + reduction + 'px)/' + items + ' + ' + factor + 'px)',
            'width': 'calc((100% + 4px - ' + reduction + 'px)/' + items + ' + ' + factor + 'px)'
        }); // 26px because to make up for the left offset. Size of last-child is also increased to avoid the skewed area on right being shown
        $('.steps span').css('padding-left', (skewOffset + 15) + "px");
        $('.steps:first-child span, .steps:last-child span').css({
            'width': '-webkit-calc(100% - ' + factor + 'px)',
            'width': 'calc(100% - ' + factor + 'px)',
        });
    }

}