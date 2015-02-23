var app = app == undefined ? {} : app;

app.dashboard = new function(){
    this.classes = {
        navigation: 'navigation'
    };


    this.init = function(){
        $('.'+this.classes.navigation+" li").hover(function(){
            $(this).find('i').addClass('fa-spin');
        }, function(){
            $(this).find('i').removeClass('fa-spin');
        });
    }

};