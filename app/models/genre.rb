class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'カフェ' },
    { id: 3, name: '居酒屋' },
    { id: 4, name: 'ラーメン' },
    { id: 5, name: 'イタリアン' },
    { id: 6, name: 'フレンチ' },
    { id: 7, name: '中華' },
    { id: 8, name: '日本料理' },
    { id: 9, name: 'そば、うどん' },
    { id: 10, name: '鉄板焼' },
    { id: 11, name: '寿司' },
    { id: 12, name: '焼き肉' },
  ]
end