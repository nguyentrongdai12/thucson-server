--[[
local _class={}
 
function class_share(super)
	local class_type={}
	class_type.ctor=false
	class_type.super=super
	class_type.new=	function(...) 
						local obj={}
						do
							local create
							create = function(c, ...)
								if c.super then
									create(c.super, unpack(arg))
								end
								if c.ctor then
									c.ctor(obj, unpack(arg))
								end
							end
			 
							create(class_type,  unpack(arg))
						end
						setmetatable(obj,{ __index=_class[class_type] })
						return obj
					end
	local vtbl={}
	_class[class_type]=vtbl
 
	setmetatable(class_type,{__newindex=
		function(t,k,v)
			vtbl[k]=v
		end
	})
 
	if super then
		setmetatable(vtbl,{__index=
			function(t,k)
				local ret=_class[super][k]
				vtbl[k]=ret
				return ret
			end
		})
	end
 
	return class_type
end
]]
--create by fantasy - 2010.02.22
--����lua_class_inc.lua(��������������ʾ)֮������һЩ�޸ģ�������Ϊ��ȡ����ʾclass(super)
--��ʾ�µ�class(super)���ϸ��C++������
--��ʾ��class(super)�����������--ͬһ����new�����Ĳ�ͬʵ���������(��vtbl�д��ֵ)������ʾ��ʵ��Ҳ���Խ�����Ӧ���ܵ���չ��������ֻ�Ǵ�C++������
--ע�⣺
--1.C++���಻��ֱ��ʹ�ã���lua��ͨ��table��ģ��ģ����ԣ�lua��ν�����ǿ���ֱ��ʹ�õģ��뾡��ʹ��new������table������
--2.����ϣ�����������ʱ����ʹ��lua�࣬����C++�����static��Ա������������һ��
function class(super)
	local class_type = {};
	class_type.super = super;
	function class_type:construct(tnew, ...)
		if self.super then self.super:construct(tnew, unpack(arg)) end
	end;
	function class_type:new(...)
		local tnew = {};
		self:construct(tnew, unpack(arg));
		setmetatable(tnew, self);
		self.__index = self;
		return tnew;
	end;
	if super then
		setmetatable(class_type, super);
		super.__index = super;
	end
	return class_type;
end




