% function [map, mapCategory] = evaluateMAP_fast_general(queryResult,queryCat,testCat,catNum, quaryCatDiff)
function [map, mapCategory] = evaluateMAP_fast_general(queryResult,queryCat,testCat,catNum)

resFlg = testCat(queryResult);

%tic
ap1 = zeros(length(queryCat),1);
% ap = zeros(size(unique(quaryCatDiff),1),1);
% start = quaryCatDiff(1);
% count = 0;
% sum = 0;
% all = 1;
for i = 1:size(queryResult,1)
    query = resFlg(i,:);
    d = find(query==queryCat(i));
    
%     top = find(d <= 50);
%     if length(top) == 0
%         ap1(i) = 0;
%         continue;
%     end
%     d = d(1:top(end));

    d = (1:length(d))./d(1:end);
%     if d(1) == 1
%         d(1) = [];
%     end
%     
%     if length(d) == 0
%         ap1(i) = 0;
%         continue;
%     end
    
    ap1(i) = mean(d);
%     if quaryCatDiff(i)~=start
%         ap(all) = sum / count;
%         sum = 0;
%         count = 0;
%         all = all + 1;
%         start = quaryCatDiff(i);
%     end
%     sum = sum + mean(d);
%     count = count + 1;
end
% ap(all) = sum / count;

% for i=1:40
%     a = ap1(find(queryCat==i));
%     fprintf('class %d : %f\n', i, mean(a));
% end
map = mean(ap1);
%toc
Category = unique(queryCat);
for i = 1:length(Category)
%     mapCategory(i,1) = mean(ap(queryCat == Category(i)));
      mapCategory(i,1) = 0;
end

end