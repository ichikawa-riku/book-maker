$(document).on('turbolinks:load', function(){
    var targets = [];
    var path = location.pathname;
    if(path == "/"){
      if (targets.length === 0){
        $(".count_down").each(function(index, element){
          var closedAt = (parseFloat($(element).text())) * 1000;
          targets.push(closedAt)
        });
      }
      function addZero(value){
        if (value < 10) {
          value = '0' + value;
        }
        return value;
      }

      function countDown(targets) {
          $(".count_down").each(function(index){
          var now = new Date();
          now.getTime();
          var closedAt = targets[index]
          var countMills = closedAt - now;
          var countSeconds = Math.floor(countMills / 1000);
          var countMinutes = Math.floor(countSeconds / 60);
          var countHours = Math.floor(countMinutes / 60);
          var countDays = Math.floor(countHours / 24);
          countSeconds = countSeconds - countMinutes * 60;
          countMinutes = countMinutes - countHours * 60;
          countHours = countHours - countDays * 24;
          countSeconds = addZero(countSeconds);
          countMinutes = addZero(countMinutes);
          countHours = addZero(countHours);
          countDays = addZero(countDays);
          var text = countDays + "日 " + countHours + "時間 " + countMinutes + "分 " + countSeconds + "秒";
          $(this).text(text);
        });
      }

      setInterval(function(){ countDown(targets) },10)

    }
});
