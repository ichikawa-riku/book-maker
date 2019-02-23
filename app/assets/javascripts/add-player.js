$(document).on('turbolinks:load', function(){
  console.log("hello")
  var index = 1
  $("#add-btn").on("click", function(){
    function buildHTML(name,odds){
      var html = `
      <div class="form-group">
        <div class="row">
          <div class="col-8">
            <label for="game_players_attributes_${index}_name">プレイヤー名</label>
            <input class="form-control" id="player-name-${index}" type="text" name="game[players_attributes][${index}][name]" />
          </div>
          <div class="col-3">
            <label for="game_players_attributes_${index}_odds">オッズ</label>
            <input class="form-control" id="player-odds-${index}" type="number" name="game[players_attributes][${index}][odds]" />
          </div>
          <div class="col-1 d-flex align-items-end">
            <button type="button" class="btn btn-danger remove-btn" id="remove-btn">削除</button>
          </div>
        </div>
      </div>`
    $('#added_player').append(html)
    var targetNameId = "player-name-" + index
    var targetOddsId = "player-odds" + index
    $("#" + targetNameId).val(name)
    $("#" + targetOddsId).val(odds)
    }
    var inputName = $('#player-name').val();
    var inputOdds = $('#player-odds').val();
    buildHTML(inputName,inputOdds);
    $('#player-name').val("");
    $('#player-odds').val("");
    index ++
    });

  $(document).on("click", ".remove-btn", function(){
    $(this).parent().parent().remove();
  });

});
