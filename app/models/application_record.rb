class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

#他モデルと重複しエラーの原因となるためapplicationにはバリデーションは設定しない
#（例えば、userモデルにtitleのバリデーションを設定することになってしまう）
end
