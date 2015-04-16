class TopController < ApplicationController
  def index
    caption = "[#{request.env['SERVER_SOFTWARE']}] "

    Thread.current[:counter] ||= 0
    Thread.current[:counter] += 1
    res1 = "Thread.current[:counter] => #{Thread.current[:counter]}"

    RequestStore.store[:foo] ||= 0
    RequestStore.store[:foo] += 1
    res2 = "RequestStore.store[:foo] => #{RequestStore.store[:foo]}"

    render :text => "#{caption} #{res1} / #{res2}"
  end
end
