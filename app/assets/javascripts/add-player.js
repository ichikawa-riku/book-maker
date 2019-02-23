$(document).on('turbolinks:load', function(){
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
            <select class="form-control" id="player-odds-${index}" name="game[players_attributes][${index}][odds]">
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
              <option value="9">9</option>
              <option value="10">10</option>
            </select>
          </div>
          <div class="col-1 d-flex align-items-end">
            <button type="button" class="btn btn-danger remove-btn" id="remove-btn">削除</button>
          </div>
        </div>
      </div>`
    $('#added_player').append(html)
    var targetNameId = "player-name-" + index
    var targetOddsId = "player-odds-" + index
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
