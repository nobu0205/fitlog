
strength_exercises = [
  { name: "ベンチプレス", muscle_group: "胸" },
  { name: "スクワット", muscle_group: "脚" },
  { name: "デッドリフト", muscle_group: "背中" },
  { name: "ショルダープレス", muscle_group: "肩" },
  { name: "バーベルカール", muscle_group: "腕" },
  { name: "トライセプスエクステンション", muscle_group: "腕" },
  { name: "ダンベルフライ", muscle_group: "胸" },
  { name: "ラットプルダウン", muscle_group: "背中" },
  { name: "ローイングマシン", muscle_group: "背中" },
  { name: "レッグプレス", muscle_group: "脚" },
  { name: "レッグカール", muscle_group: "脚" },
  { name: "チェストプレス", muscle_group: "胸" },
  { name: "ショルダープレスマシン", muscle_group: "肩" },
  { name: "アブドミナルマシン", muscle_group: "体幹" },
  { name: "ケーブルクロスオーバー", muscle_group: "胸" },
  { name: "ケーブルフライ", muscle_group: "胸" },
  { name: "ケーブルショルダープレス", muscle_group: "肩" },
  { name: "ケーブルサイドレイズ", muscle_group: "肩" }
]

strength_exercises.each do |ex|
  Exercise.find_or_create_by!(name: ex[:name]) do |exercise|
    exercise.muscle_group = ex[:muscle_group]
    exercise.exercise_type = :strength
  end
end

# 有酸素メニュー
cardio_exercises = [
  { name: "ランニング", muscle_group: "脚" },
  { name: "ウォーキング", muscle_group: "脚" },
  { name: "サイクリング", muscle_group: "脚" }
]

cardio_exercises.each do |ex|
  Exercise.find_or_create_by!(name: ex[:name]) do |exercise|
    exercise.muscle_group = ex[:muscle_group]
    exercise.exercise_type = :cardio
  end
end
