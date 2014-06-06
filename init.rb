Redmine::Plugin.register :announcements do
  name 'Announcements plugin'
  author 'Gustavo Leon'
  description 'Announcements dashboard for Redmine'
  version '0.2'
  url 'http://github.com/hpneo/announcements'
  author_url 'http://hpneo.github.io'

  permission :view_announcements, announcements: :index
  permission :create_announcements, announcements: :create
  menu :top_menu, :announcements, { controller: 'announcements', action: 'index' }, caption: 'Announcements', if: Proc.new { User.current.allowed_to?(:view_announcements, nil, global: true) }
end
