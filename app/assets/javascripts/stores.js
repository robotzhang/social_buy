$(document).ready(function() {
    $('a[data-toggle="tooltip"]').tooltip({placement: 'top'});

    $('#btn_edit_store').click(function(){
        $this = $(this);
        var panel = $('#panel_edit_store');
        if (panel.find('.loading').length == 0) {
            panel.toggle();
        } else {
            panel.css({top: $this.offset().top + $this.outerHeight() + 10}).show();
            $.get($this.data('href'), function(html){
                panel.find('.content').html(html);
                panel.css({left: $this.offset().left - panel.width() / 2 + $this.width() / 2})
                    .show();
                $('a[data-toggle="tooltip"]').tooltip({placement: 'top'});
                panel.find('.loading').remove();
            });
        }
        return false;
    });
});