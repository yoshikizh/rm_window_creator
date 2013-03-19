# RmWindowCreator

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'rm_window_creator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rm_window_creator

## Usage

初始化方法:

RmWindowCreator::Window.selectable(x,y,w,h) do |config|
config.hack         :default,:obj=>:actor, :max => 4, :col_max=> 1,
                    :fontsize=>14,:color=>Color.new(255,255,255,255),:start=>[0,0],:space=>[20,20],
                    :opacity => 255,:active=>true
end

actor 的配置:
config.hack         :face,      :start => [0,0],:space=>[20,20],:size=>96
config.hack         :character, :start => [0,0],:space=>[20,20]
config.hack         :name,      :start => [0,0],:space=>[20,20],:color=>Color.new(255,128,128,255),:fontsize=>18
config.hack         :level,     :start => [0,0],:space=>[20,20],:color=>Color.new(255,128,128,255),:fontsize=>16,:sub=>"等级"
config.hack         :nickname,  :start => [0,0],:space=>[20,20]
config.hack         :hp,        :start => [0,0],:space=>[20,20],:color=>Color.new(128,200,192,255)
config.hack         :mp,        :start => [0,0],:space=>[20,20],:color=>Color.new(0,255,0,255)
config.hack         :tp,        :start => [0,0],:space=>[20,20],:color=>Color.new(0,0,255,255)
config.hack         :hp_gauge,  :start => [0,0],:space=>[20,20]
config.hack         :mp_gauge,  :start => [0,0],:space=>[20,20]
config.hack         :tp_gauge,  :start => [0,0],:space=>[20,20]

item , equipment , armor 等的配置:

config.hack         :icon,      :start => [0,0],:space=>[20,20]
config.hack         :desc,      :start => [0,0],:space=>[20,20]
config.hack         :price,     :start => [0,0],:space=>[20,20]
config.hack         :gold,      :pos=>[300,300]
config.hack         :item_rect, :col_max => 1,:spacing=>32,:item_max=>4,:item_height=>32,:item_width=>32
config.hack         :background,:btm=>"system/xxx.jpg",:x=>0,:y=>0
config.hack         :handler,   :ok => method(:command_ok),:cancel=> method(:command_cancel)

 
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
