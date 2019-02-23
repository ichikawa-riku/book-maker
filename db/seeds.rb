50.times do
  player1 = Faker::WorldCup.team
  player2 = Faker::WorldCup.team
  players = []
  players << player1
  players << player2
  deadline_at = Faker::Time.between(2.days.ago, 5.days.from_now)
  game = Game.create!(
    title: player1 + " vs " + player2,
    closed_at: deadline_at,
    is_closed: false,
    finished_at: deadline_at.tomorrow,
    is_finished: false
    )
  Owner.create!(
    user_id: 1,
    game_id: game.id
    )
  Player.create!(
    game_id: game.id,
    name: player1,
    odds: Faker::Number.between(1, 10)
    )
  Player.create!(
    game_id: game.id,
    name: player2,
    odds: Faker::Number.between(1, 10)
    )
end
