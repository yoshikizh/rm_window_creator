#encoding:utf-8
module RmWindowCreator
  def self.included(base)
    base.extend Packer
  end
  def method_missing(method_name,*args)
    # face character name level nickname hp mp tp hp_gauge mp_gauge tp_gauge
    if method_name =~ /^_draw_(.*)$/
      m = $1
      window = args.first ; btm = window.contents
      cfg = window.config
      hash = cfg.send(m)  if cfg.respond_to? m
      body = cfg.default[:obj]
      if $1 == "face"
        puts "face"
        puts hash
      end
      window.items.each_with_index do |item,index|
        if item
          pos = window.items.first.send :get_pos_and_margin,index,default,hash
          window.items.first.send("#{m}!",window,cfg.default,hash,item,index,pos)
        end
      end if window.items.first.respond_to? "#{m}!"
    end
  end

  module Window
    module_function
    def base(*args,&blk)
      Window_Custom_Base.create(*args,&blk)
    end
    def selectable(*args,&blk)
      Window_Custom_Selectable.create(*args,&blk)
    end
  end

  module Scene ;  end  # scene hack 还未写
end