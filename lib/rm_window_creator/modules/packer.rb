#encoding:utf-8
module RmWindowCreator
  module Packer
    class CleanRoom ;  end
    def born(kls,*args,&blk)
      obj = kls.new(*args)
      obj.instance_eval do
        @config = CleanRoom.new
        class << @config
          def hack(method_name,args)
            self.class.class_eval do
              define_method method_name do
                return args
              end
            end
          end
        end
        eval "def config ; @config ; end"
      end
      obj
    end

    def check_default obj
      if d = obj.config.default
        if d[:obj]
          obj.class.class_eval do
            define_method :items do
              @items ||= case d[:obj]
                when :actor  ;      $game_party.members
                when :item   ;      $game_party.items
                when :weapon ;      $game_party.weapons
                when :armor  ;      $game_party.armors
                when :equip_items ; $game_party.equip_items
                when :all_items   ; $game_party.all_items
              end
              @items.take(d[:max]) if d[:max]
            end
            define_method :item do
              @items[self.index]
            end
          end
        end
        obj.opacity = d[:opacity] || 255
      end
    end
    def check_background obj
      if obj.config.respond_to? :background
        b = obj.config.background
        obj.class.class_eval do
          define_method :set_background do
            @background = Sprite.create do |sp|
              b[:btm] =~ /^(.*)\/(.*)$/ 
              sp.attrset :x=> b[:x] , :y=> b[:y] , :bitmap=>Cache.send($1,$2)
            end
          end
        end
      end
    end
    def check_item_rect obj 
      if r = obj.config.item_rect
        obj.class.class_eval do
          define_method :item_max     do r[:item_max]    || super ; end
          define_method :col_max      do r[:col_max]     || super ; end  
          define_method :spacing      do r[:spacing]     || super ; end  
          define_method :item_height  do r[:item_height] || super ; end  
          define_method :item_width   do r[:item_width]  || super ; end  
        end
      end
    end
    def check_handler obj
      if obj.config.respond_to? :handler
        hander = obj.config.handler
        obj.set_handler(:ok, handler[:ok]) if handler[:ok]
        obj.set_handler(:cancel, handler[:cancel]) if handler[:cancel]
      end
    end
  end
end