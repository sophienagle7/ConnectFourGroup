figure('Units','normalized','Position',[.2 .2 .6 .6], 'Name','Connect Four','Color','w');
axes('Units','normalized','Position',[.1 .1 .8 .8],'Color','y','LineWidth',1,'Box','on');
set(gca, 'XTick',[],'YTick',[],'XLim',[0,160],'YLim',[0,160]);
hold on;
for row = 1:7
    for col = 1:7
        board(row,col) = plot(col*20,row*20, 'wo','MarkerSize',40,'LineWidth',1,'MarkerFaceColor',[1 1 1]','MarkerEdgeColor', [0 0 0]);
    end
end