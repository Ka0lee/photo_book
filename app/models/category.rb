class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '動物' },
    { id: 3, name: '食べ物' },
    { id: 4, name: '家族' },
    { id: 5, name: '景色' },
    { id: 6, name: '季節' },
    { id: 7, name: '行事' },
    { id: 8, name: '旅行' },
    { id: 9, name: '仕事' },
    { id: 10, name: '記念' },
    { id: 11, name: 'その他' }
  ]


  include ActiveHash::Associations
  has_many :photographs

  end