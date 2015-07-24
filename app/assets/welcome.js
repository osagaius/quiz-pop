var app = app == undefined ? {} : app;

app.dashboard = new function(){
    this.classes = {
        navigation: 'navigation'
    };


    this.init = function(){
        this.spinIcons();
        this.bindDropdown();
    }

    this.spinIcons = function(){
        $('.'+this.classes.navigation+" li").hover(function(){
            $(this).find('i').addClass('fa-spin');
        }, function(){
            $(this).find('i').removeClass('fa-spin');
        });
    };

    this.bindDropdown = function(){
        var button = document.getElementById('submit-question');
        var categories = document.getElementById('categories-dropdown');
        var shown = false;

        button.addEventListener('click', function(e){
            if(shown){
                categories.style.display = 'none';
            }else{
                categories.style.display = 'inline-block';
            }

            shown = !shown;
        });
    };

};
