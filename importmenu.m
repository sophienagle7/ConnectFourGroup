function importmenu
fig = uifigure;
m = uimenu(fig,'Text','&Import');
 
mitem = uimenu(m,'Text','&MATLAB Script');
mitem.Accelerator = 'T';
mitem.MenuSelectedFcn = @MenuSelected;
 
    function MenuSelected(src,event)
        file = uigetfile('*.txt');
    end
 
end
