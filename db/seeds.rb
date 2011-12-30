# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# -*- encoding: UTF-8 -*-
names = [ "切手を買う", "報告書を書く", "家賃を払う", "猫の餌を買う", "燃えないゴミを出す"
]
description = "これは説明です。" * 20
5.times do |n|
  Task.create(:name => names[n], :description => description,
    :due_date => (n - 2).days.from_now, :done => n.zero?)
end

200.times do |n|
  Task.create(:name => "Task #{n}", :description => description,
    :due_date => (n + 3).days.from_now, :done => false)
end

