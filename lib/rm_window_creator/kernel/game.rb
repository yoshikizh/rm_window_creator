class Game_Actor < Game_Battler
  include Creator::Draw::GameActor
end
class RPG::BaseItem
  include Creator::Draw::BaseItem
end

class RPG::Item < RPG::UsableItem
  include Creator::Draw::Item
end

class Window_Custom_Selectable < Window_Selectable
  include RmWindowCreator
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  class << self
    attr_reader :config
    def create(*args,&blk)
      obj = born(self,*args)
      blk.call obj.config if blk
      check_default     obj
      check_background  obj
      check_item_rect   obj
      check_handler     obj
      obj.set_background if obj.respond_to? :set_background
      obj.refresh if obj.respond_to? :refresh
      obj.update if obj.respond_to? :update
      obj.activate if obj.config.default[:active]
      obj
    end
  end
  #--------------------------------------------------------------------------
  # ● 初始化对象
  #-------------------------------------------------------------------------
  def initialize(x, y, width , height)
    super(x, y, width, height)
    self.index = 0
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    default = config.default
    gold = config.gold if config.respond_to? :gold
    obj = default[:obj]
    %w{face character name lv nickname hp mp tp hp_gauge mp_gauge tp_gauge}.each do |m|
      self.send("_draw_#{m}",self)
    end
  end

  def dispose
    super
    instance_variables.each do |varname|
      ivar = instance_variable_get(varname)
      if ivar.is_a?(Sprite)
        ivar.dispose 
        ivar.bitmap.dispose unless ivar.bitmap.nil?
      end
    end
  end

  def update
    super
  end
end
