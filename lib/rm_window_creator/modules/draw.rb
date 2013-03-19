#encoding:utf-8
module RmWindowCreator
  module Draw
    module GameActor
      def face! w,default,hash,item,index,pos
        w.draw_actor_face(item, pos.first, pos.last,hash[:size] ? hash[:size] : nil) if pos
      end
      def character! w,default,hash,item,index,pos
        w.draw_actor_graphic(item, pos.first, pos.last+32) if pos
      end

      # draw_actor_name(actor, x, y)
      # draw_actor_level(actor, x, y + line_height * 1)
      # draw_actor_icons(actor, x, y + line_height * 2)
      # draw_actor_class(actor, x + 120, y)
      # draw_actor_hp(actor, x + 120, y + line_height * 1)
      # draw_actor_mp(actor, x + 120, y + line_height * 2)
      # draw_actor_hp_gauge(actor, x, y, width = 114)

      def name! w,default,hash,item,index,pos
        w.draw_actor_name(item, pos.first, pos.last) if pos
      end
      
      def level! w,default,hash,item,index,pos
        w.draw_actor_leve(item, pos.first, pos.last) if pos
      end
      
      def nickname! w,default,hash,item,index,pos
        w.draw_actor_class(item, pos.first, pos.last) if pos
      end
      
      def hp!        w,default,hash,item,index,pos ;  
        #w.draw_actor_hp(item, pos.first, pos.last) if pos
        w.contents.draw_text(pos.first, pos.last, 30, w.line_height, Vocab::hp_a)
        w.draw_current_and_max_values(pos.first, pos.last, 124, item.hp, item.mhp,
         w.hp_color(item), w.normal_color)
      end

      def mp!        w,default,hash,item,index,pos ;  
        #w.draw_actor_mp(item, pos.first, pos.last) if pos
      end

      def hp_gauge!  w,default,hash,item,index,pos ;  
        w.draw_gauge(pos.first, pos.last, 124, item.hp_rate, w.hp_gauge_color1, w.hp_gauge_color2)
        w.change_color(w.system_color)
        #w.draw_actor_hp_gauge(item, pos.first, pos.last) if pos
      end

      def mp_gauge!  w,default,hash,item,index,pos ;  end
      def tp_gauge!  w,default,hash,item,index,pos ;  end
      private
      def get_pos_and_margin(index,default,hash)
        if start = hash[:start] ? hash[:start] : default[:start]
          x,y = start.first,start.last
        end
        if space = hash[:space] ? hash[:space] : default[:space]
          margin_x,margin_y = space.first,space.last
        end
        if start && space
          return x + margin_x * index ,  y + margin_y * index
        else
          return nil
        end
      end
    end

    module BaseItem
      def icon! ;  end
      def name! ;  end
      def desc! ;  end
    end

    module Item
      def price! ; end
    end
  end
end