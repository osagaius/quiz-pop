(function($){$.fn.progressTimer=function(options){var settings=$.extend({},$.fn.progressTimer.defaults,options);this.each(function(){$(this).empty();var barContainer=$("<div>").addClass("progress active progress-striped");var bar=$("<div>").addClass("progress-bar").addClass(settings.baseStyle).attr("role","progressbar").attr("aria-valuenow","0").attr("aria-valuemin","0").attr("aria-valuemax",settings.timeLimit);bar.appendTo(barContainer);barContainer.appendTo($(this));var start=new Date;var limit=settings.timeLimit*1e3;var interval=window.setInterval(function(){var elapsed=new Date-start;bar.width(elapsed/limit*100+"%");if(limit-elapsed<=5e3)bar.removeClass(settings.baseStyle).removeClass(settings.completeStyle).addClass(settings.warningStyle);if(elapsed>=limit){window.clearInterval(interval);bar.removeClass(settings.baseStyle).removeClass(settings.warningStyle).addClass(settings.completeStyle);settings.onFinish.call(this)}},250)});return this};$.fn.progressTimer.defaults={timeLimit:60,warningThreshold:5,onFinish:function(){},baseStyle:"",warningStyle:"progress-bar-danger",completeStyle:"progress-bar-success"}})(jQuery);