function results = fgo_5th
%fgo五周年福袋
%----------------------
%没有，很想要：1
%没有，new不亏：2
%没有，雷：3
%有，想补宝：4
%有，雷：5
%---------------------
group_1 = [2,3,2,2,5,5,5,5,5,5,5,3,2,2];
group_2 = [3,2,5,2,5,2,5,5,5,5,3,3,3,5,5];
group_3 = [2,2,5,5,5,5,2,3,2,5,5];
group_4 = [2,5,5,2,2,2,1,1,5,2];
group_5 = [1,4,5,4,2,2,2,2,5,2];
[score_1,none_1,hate_1] = evaluate(group_1);
[score_2,none_2,hate_2] = evaluate(group_2);
[score_3,none_3,hate_3] = evaluate(group_3);
[score_4,none_4,hate_4] = evaluate(group_4);
[score_5,none_5,hate_5] = evaluate(group_5);
results = {'年限','得分','new概率','中雷概率'};
for x = 1:5
    eval(['results{',num2str(x+1),',1} = ''',num2str(2015+x),'-',num2str(2016+x),''';'])
    eval(['results{',num2str(x+1),',2} = score_',num2str(x),';'])
    eval(['results{',num2str(x+1),',3} = none_',num2str(x),';'])
    eval(['results{',num2str(x+1),',4} = hate_',num2str(x),';'])
end
end
function [score,none,hate] = evaluate(group)
%-------
%score:得分
%none:出new；
%hate:中雷
%---------
%score得分方式------------
%没有，很想要：+2
%没有，new不亏：+1
%没有，雷：0
%有，想补宝：+2
%有，雷：0
%----------------------------
score = 0;
none = 0;
hate = 0;
for x = 1:length(group)
    switch group(x)
        case 1
            score = score+2;
            none = none+1;
        case 2
            score = score+1;
            none = none+1;
        case 3
            none = none+1;
            hate = hate+1;
        case 4
            score = score+2;
        case 5
            hate = hate+1;
    end
end
score = score/length(group);
none = none/length(group)*100;
hate = hate/length(group)*100;
end
