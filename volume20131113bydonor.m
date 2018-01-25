clear all
close all

Th = 100;

Data = importdata('20131117 Volume measurement sGC .xls');

DataC = struct2cell(Data.data);
%Update how many there are at each condition
Citrate_n=10;
PPackhep_n=6;
Mesamp_n=3;
Total_n=Citrate_n+PPackhep_n+Mesamp_n;

for m=1:Total_n
C= zeros; 
Size = zeros;
Avg = zeros;
std=zeros;
C= cell2mat(DataC(m));
Size=size(C);


 for j=1:Size(2)
    for i=1:Size(1)
  
    

if C(i,j)>Th
    C(i,j)=C(i,j);
else C(i,j)= NaN;
end

    end
 end
 
TData(m)= mat2cell(C);
Avg=nanmean(C);
std=nanstd(C);

 
 AvgC(m) = mat2cell(Avg);
 stdC(m) = mat2cell(std);
end
%For all the citrate conditions

for i = 1:Citrate_n
for j = 1:3:15
%Non normalized data
%First row is 200, second is 500, third is 1000
Citrate_mean{i,j}=AvgC{i}(j);
Citrate_mean{i,j+1} =AvgC{i}(j+1); 
Citrate_mean{i,j+2} = AvgC{i}(j+2);
%Standard deviation
Citrate_std{i,j}=stdC{i}(j);
Citrate_std{i,j+1} =stdC{i}(j+1); 
Citrate_std{i,j+2} = stdC{i}(j+2);
%Normalized averages
Citrate_nmean{i,j}=AvgC{i}(j)/AvgC{i}(1);
Citrate_nmean{i,j+1} =AvgC{i}(j+1)/AvgC{i}(2); 
Citrate_nmean{i,j+2} = AvgC{i}(j+2)/AvgC{i}(3);

%Must do error propagation when normalizing
Citrate_nstd{i,j}=sqrt((stdC{i}(j)/AvgC{i}(j))^2+((stdC{i}(1)/AvgC{i}(1))^2)*AvgC{i}(j)/AvgC{i}(1));
Citrate_nstd{i,j+1}=sqrt((stdC{i}(j+1)/AvgC{i}(j+1))^2+((stdC{i}(2)/AvgC{i}(2))^2)*AvgC{i}(j+1)/AvgC{i}(2));
Citrate_nstd{i,j+2}=sqrt((stdC{i}(j+2)/AvgC{i}(j+2))^2+((stdC{i}(3)/AvgC{i}(3))^2)*AvgC{i}(j+2)/AvgC{i}(3));

end
end



%For PPAck conditions
for i= Citrate_n+1:Citrate_n+PPackhep_n
 for j = 1:3:15   
%Non normalized data
%First row is 200, second is 500, third is 1000
PPack_mean{i-Citrate_n,j}=AvgC{i}(j);
PPack_mean{i-Citrate_n,j+1} =AvgC{i}(j+1); 
PPack_mean{i-Citrate_n,j+2} = AvgC{i}(j+2);
%Standard deviation
PPack_std{i-Citrate_n,j}=stdC{i}(j);
PPack_std{i-Citrate_n,j+1} =stdC{i}(j+1); 
PPack_std{i-Citrate_n,j+2} = stdC{i}(j+2);
%Normalized data
PPack_nmean{i-Citrate_n,j}=AvgC{i}(j)/AvgC{i}(1);
PPack_nmean{i-Citrate_n,j+1} =AvgC{i}(j+1)/AvgC{i}(2); 
PPack_nmean{i-Citrate_n,j+2} = AvgC{i}(j+2)/AvgC{i}(3);
%Must do error propagation when normalizing
PPack_nstd{i-Citrate_n,j}=sqrt((stdC{i}(j)/AvgC{i}(j))^2+((stdC{i}(1)/AvgC{i}(1))^2)*AvgC{i}(j)/AvgC{i}(1));
PPack_nstd{i-Citrate_n,j+1}=sqrt((stdC{i}(j+1)/AvgC{i}(j+1))^2+((stdC{i}(2)/AvgC{i}(2))^2)*AvgC{i}(j+1)/AvgC{i}(2));
PPack_nstd{i-Citrate_n,j+2}=sqrt((stdC{i}(j+2)/AvgC{i}(j+2))^2+((stdC{i}(3)/AvgC{i}(3))^2)*AvgC{i}(j+2)/AvgC{i}(3));

 end
end

%For MeSAMP Conditions
for i= Citrate_n+PPackhep_n+1:Total_n
    for j = 1:3:15
        %Non normalized data
%First row is 200, second is 500, third is 1000
MeSamp_mean{i-(Citrate_n+PPackhep_n),j}=AvgC{i}(j);
MeSamp_mean{i-(Citrate_n+PPackhep_n),j+1} =AvgC{i}(j+1); 
MeSamp_mean{i-(Citrate_n+PPackhep_n),j+2} = AvgC{i}(j+2);
%Standard deviation
MeSamp_std{i-(Citrate_n+PPackhep_n),j}=stdC{i}(j);
MeSamp_std{i-(Citrate_n+PPackhep_n),j+1} =stdC{i}(j+1); 
MeSamp_std{i-(Citrate_n+PPackhep_n),j+2} = stdC{i}(j+2);
%Normalized data
MeSamp_nmean{i-(Citrate_n+PPackhep_n),j}=AvgC{i}(j)/AvgC{i}(1);
MeSamp_nmean{i-(Citrate_n+PPackhep_n),j+1} =AvgC{i}(j+1)/AvgC{i}(2); 
MeSamp_nmean{i-(Citrate_n+PPackhep_n),j+2} = AvgC{i}(j+2)/AvgC{i}(3);

MeSamp_nstd{i-(Citrate_n+PPackhep_n),j}=sqrt((stdC{i}(j)/AvgC{i}(j))^2+((stdC{i}(1)/AvgC{i}(1))^2)*AvgC{i}(j)/AvgC{i}(1));
MeSamp_nstd{i-(Citrate_n+PPackhep_n),j+1}=sqrt((stdC{i}(j+1)/AvgC{i}(j+1))^2+((stdC{i}(2)/AvgC{i}(2))^2)*AvgC{i}(j+1)/AvgC{i}(2));
MeSamp_nstd{i-(Citrate_n+PPackhep_n),j+2}=sqrt((stdC{i}(j+2)/AvgC{i}(j+2))^2+((stdC{i}(3)/AvgC{i}(3))^2)*AvgC{i}(j+2)/AvgC{i}(3));
    end
end

%Put all data together for boxplot
Citrate=nancat(1,TData{1:Citrate_n});
PPack=nancat(1,TData{Citrate_n+1:Citrate_n+PPackhep_n});
MeSamp=nancat(1,TData{Citrate_n+PPackhep_n+1:Total_n});

  %Box plot of all the individual platelet aggregates  
figure; 
groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};

ax(1)=subplot(3,3,1);
boxplot(ax(1),nancat(2,Citrate(:,1:3:15)),groupnames);
ax(2)=subplot(3,3,2);
boxplot(ax(2),nancat(2,Citrate(:,2:3:15)),groupnames);
ax(3)=subplot(3,3,3);
boxplot(ax(3),nancat(2,Citrate(:,3:3:15)),groupnames);
ax(4)=subplot(3,3,4);
boxplot(ax(4),nancat(2,PPack(:,1:3:15)),groupnames);
ax(5)=subplot(3,3,5);
boxplot(ax(5),nancat(2,PPack(:,2:3:15)),groupnames);
ax(6)=subplot(3,3,6);
boxplot(ax(6),nancat(2,PPack(:,3:3:15)),groupnames);
ax(7)=subplot(3,3,7);
boxplot(ax(7),nancat(2,MeSamp(:,1:3:15)),groupnames);
ax(8)=subplot(3,3,8);
boxplot(ax(8),nancat(2,MeSamp(:,2:3:15)),groupnames);
ax(9)=subplot(3,3,9);
boxplot(ax(9),nancat(2,MeSamp(:,3:3:15)),groupnames);
X=nancat(2,Citrate(:,1:3:15));

%Makes all axes have the same scale as the first listed axes
linkaxes([ax(1) ax(2) ax(3) ],'y');
linkaxes([ax(5)  ax(4) ax(6)],'y');
linkaxes( [ax(7) ax(8) ax(9)],'y');



%%
%Plot  data
figure;

ax(1)=subplot(3,3,1);
    Citrate200_nmeans = [Citrate_nmean{:,1};Citrate_nmean{:,4}; Citrate_nmean{:,7};Citrate_nmean{:,10};Citrate_nmean{:,13}];   
    Citrate200_nerrors = [Citrate_nstd{:,1};Citrate_nstd{:,4}; Citrate_nstd{:,7};Citrate_nstd{:,10};Citrate_nstd{:,13}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'Citrate 200';
    barweb(Citrate200_nmeans, Citrate200_nerrors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot');
    handles.ax = ax(1);

ax(2)=subplot(3,3,2);
    Citrate500_nmeans = [Citrate_nmean{:,2};Citrate_nmean{:,5}; Citrate_nmean{:,8};Citrate_nmean{:,11};Citrate_nmean{:,14}];   
    Citrate500_nerrors = [Citrate_nstd{:,2};Citrate_nstd{:,5}; Citrate_nstd{:,8};Citrate_nstd{:,11};Citrate_nstd{:,14}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'Citrate 500';
    barweb(Citrate500_nmeans, Citrate500_nerrors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot')
    handles.ax = ax(2);

ax(3)=subplot(3,3,3);
    Citrate1000_nmeans = [Citrate_nmean{:,3};Citrate_nmean{:,6}; Citrate_nmean{:,9};Citrate_nmean{:,12};Citrate_nmean{:,15}];   
    Citrate1000_nerrors = [Citrate_nstd{:,3};Citrate_nstd{:,6}; Citrate_nstd{:,9};Citrate_nstd{:,12};Citrate_nstd{:,15}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'Citrate 1000';
    barweb(Citrate1000_nmeans, Citrate1000_nerrors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot');
    handles.ax = ax(3);
    
 ax(4)=subplot(3,3,4);
    PPack200_nmeans = [PPack_nmean{:,1};PPack_nmean{:,4}; PPack_nmean{:,7};PPack_nmean{:,10};PPack_nmean{:,13}];   
    PPack200_nerrors = [PPack_nstd{:,1};PPack_nstd{:,4}; PPack_nstd{:,7};PPack_nstd{:,10};PPack_nstd{:,13}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'PPack 200';
    barweb(PPack200_nmeans, PPack200_nerrors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot');
    handles.ax = ax(4);

ax(5)=subplot(3,3,5);
    PPack500_nmeans = [PPack_nmean{:,2};PPack_nmean{:,5}; PPack_nmean{:,8};PPack_nmean{:,11};PPack_nmean{:,14}];   
    PPack500_nerrors = [PPack_nstd{:,2};PPack_nstd{:,5}; PPack_nstd{:,8};PPack_nstd{:,11};PPack_nstd{:,14}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'PPack 500';
    barweb(PPack500_nmeans, PPack500_nerrors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot');
    handles.ax = ax(5);

ax(6)=subplot(3,3,6)
    PPack1000_nmeans = [PPack_nmean{:,3};PPack_nmean{:,6}; PPack_nmean{:,9};PPack_nmean{:,12};PPack_nmean{:,15}];   
    PPack1000_nerrors = [PPack_nstd{:,3};PPack_nstd{:,6}; PPack_nstd{:,9};PPack_nstd{:,12};PPack_nstd{:,15}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'PPack 1000';
    barweb(PPack1000_nmeans, PPack1000_nerrors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot');
        handles.ax = ax(6);
        
 ax(7)=subplot(3,3,7);
    MeSamp200_nmeans = [MeSamp_nmean{:,1};MeSamp_nmean{:,4}; MeSamp_nmean{:,7};MeSamp_nmean{:,10};MeSamp_nmean{:,13}];   
    MeSamp200_nerrors = [MeSamp_nstd{:,1};MeSamp_nstd{:,4}; MeSamp_nstd{:,7};MeSamp_nstd{:,10};MeSamp_nstd{:,13}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'Mesamp 200';
    barweb(MeSamp200_nmeans, MeSamp200_nerrors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot');
    handles.ax = ax(7);

ax(8)=subplot(3,3,8);
    MeSamp500_nmeans = [MeSamp_nmean{:,2};MeSamp_nmean{:,5}; MeSamp_nmean{:,8};MeSamp_nmean{:,11};MeSamp_nmean{:,14}];   
    MeSamp500_nerrors = [MeSamp_nstd{:,2};MeSamp_nstd{:,5}; MeSamp_nstd{:,8};MeSamp_nstd{:,11};MeSamp_nstd{:,14}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'Mesamp 500';
    barweb(MeSamp500_nmeans, MeSamp500_nerrors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot');
    handles.ax = ax(8);

ax(9)=subplot(3,3,9);
    MeSamp1000_nmeans = [MeSamp_nmean{:,3};MeSamp_nmean{:,6}; MeSamp_nmean{:,9};MeSamp_nmean{:,12};MeSamp_nmean{:,15}];   
    MeSamp1000_nerrors = [MeSamp_nstd{:,3};MeSamp_nstd{:,6}; MeSamp_nstd{:,9};MeSamp_nstd{:,12};MeSamp_nstd{:,15}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'Mesamp 1000';
    barweb(MeSamp1000_nmeans, MeSamp1000_nerrors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot');
    handles.ax = ax(9);
        
   
%Makes all axes have the same scale as the first listed axes
linkaxes([ax(1) ax(2) ax(3) ],'y');
linkaxes([ax(4)  ax(5) ax(6)],'y');
linkaxes([ax(7) ax(8) ax(9)],'y');

%%
%Plot the boxplot of the normalized averages
figure; 
groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};

ax(1)=subplot(3,3,1);
boxplot(ax(1),Citrate200_nmeans',groupnames);
ax(2)=subplot(3,3,2)
boxplot(ax(2),Citrate500_nmeans',groupnames);
ax(3)=subplot(3,3,3)
boxplot(ax(3),Citrate1000_nmeans',groupnames);
ax(4)=subplot(3,3,4)
boxplot(ax(4),PPack200_nmeans',groupnames);
ax(5)=subplot(3,3,5)
boxplot(ax(5),PPack500_nmeans',groupnames);
ax(6)=subplot(3,3,6)
boxplot(ax(6),PPack1000_nmeans',groupnames);
ax(7)=subplot(3,3,7)
boxplot(ax(7),MeSamp200_nmeans',groupnames);
ax(8)=subplot(3,3,8)
boxplot(ax(8),MeSamp500_nmeans',groupnames);
ax(9)=subplot(3,3,9)
boxplot(ax(9),MeSamp1000_nmeans',groupnames);


%Makes all axes have the same scale as the first listed axes
linkaxes([ax(1) ax(2) ax(3) ],'y');
linkaxes([ax(5)  ax(4) ax(6)],'y');
linkaxes([ax(8) ax(7) ax(9)],'y');


%%
%Plot  data
figure;

ax(1)=subplot(3,3,1)
    Citrate200_means = [Citrate_mean{:,1};Citrate_mean{:,4}; Citrate_mean{:,7};Citrate_mean{:,10};Citrate_mean{:,13}];   
    Citrate200_errors = [Citrate_std{:,1};Citrate_std{:,4}; Citrate_std{:,7};Citrate_std{:,10};Citrate_std{:,13}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'Citrate 200';
    barweb(Citrate200_means, Citrate200_errors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot');
    handles.ax = ax(1);

ax(2)=subplot(3,3,2)
    Citrate500_means = [Citrate_mean{:,2};Citrate_mean{:,5}; Citrate_mean{:,8};Citrate_mean{:,11};Citrate_mean{:,14}];   
    Citrate500_errors = [Citrate_std{:,2};Citrate_std{:,5}; Citrate_std{:,8};Citrate_std{:,11};Citrate_std{:,14}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'Citrate 500';
    barweb(Citrate500_means, Citrate500_errors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot')
    handles.ax = ax(2);

ax(3)=subplot(3,3,3)
    Citrate1000_means = [Citrate_mean{:,3};Citrate_mean{:,6}; Citrate_mean{:,9};Citrate_mean{:,12};Citrate_mean{:,15}];   
    Citrate1000_errors = [Citrate_std{:,3};Citrate_std{:,6}; Citrate_std{:,9};Citrate_std{:,12};Citrate_std{:,15}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'Citrate 1000';
    barweb(Citrate1000_means, Citrate1000_errors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot');
    handles.ax = ax(3);
    
 ax(4)=subplot(3,3,4)
    PPack200_means = [PPack_mean{:,1};PPack_mean{:,4}; PPack_mean{:,7};PPack_mean{:,10};PPack_mean{:,13}];   
    PPack200_errors = [PPack_std{:,1};PPack_std{:,4}; PPack_std{:,7};PPack_std{:,10};PPack_std{:,13}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'PPack 200';
    barweb(PPack200_means, PPack200_errors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot');
    handles.ax = ax(4);

ax(5)=subplot(3,3,5)
    PPack500_means = [PPack_mean{:,2};PPack_mean{:,5}; PPack_mean{:,8};PPack_mean{:,11};PPack_mean{:,14}];   
    PPack500_errors = [PPack_std{:,2};PPack_std{:,5}; PPack_std{:,8};PPack_std{:,11};PPack_std{:,14}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'PPack 500';
    barweb(PPack500_means, PPack500_errors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot');
    handles.ax = ax(5);

ax(6)=subplot(3,3,6)
    PPack1000_means = [PPack_mean{:,3};PPack_mean{:,6}; PPack_mean{:,9};PPack_mean{:,12};PPack_mean{:,15}];   
    PPack1000_nerrors = [PPack_std{:,3};PPack_std{:,6}; PPack_std{:,9};PPack_std{:,12};PPack_std{:,15}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'PPack 1000';
    barweb(PPack1000_nmeans, PPack1000_nerrors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot');
        handles.ax = ax(6);
        
 ax(7)=subplot(3,3,7)
    MeSamp200_means = [MeSamp_mean{:,1};MeSamp_mean{:,4}; MeSamp_mean{:,7};MeSamp_mean{:,10};MeSamp_mean{:,13}];   
    MeSamp200_errors = [MeSamp_std{:,1};MeSamp_std{:,4}; MeSamp_std{:,7};MeSamp_std{:,10};MeSamp_std{:,13}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'Mesamp 200';
    barweb(MeSamp200_means, MeSamp200_errors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot');
    handles.ax = ax(7);

ax(8)=subplot(3,3,8)
    MeSamp500_means = [MeSamp_mean{:,2};MeSamp_mean{:,5}; MeSamp_mean{:,8};MeSamp_mean{:,11};MeSamp_mean{:,14}];   
    MeSamp500_errors = [MeSamp_std{:,2};MeSamp_std{:,5}; MeSamp_std{:,8};MeSamp_std{:,11};MeSamp_std{:,14}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'Mesamp 500';
    barweb(MeSamp500_means, MeSamp500_errors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot');
    handles.ax = ax(8);

ax(9)=subplot(3,3,9)
    MeSamp1000_means = [MeSamp_mean{:,3};MeSamp_mean{:,6}; MeSamp_mean{:,9};MeSamp_mean{:,12};MeSamp_mean{:,15}];   
    MeSamp1000_errors = [MeSamp_std{:,3};MeSamp_std{:,6}; MeSamp_std{:,9};MeSamp_std{:,12};MeSamp_std{:,15}];
    groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};
    bw_title = 'Mesamp 1000';
    barweb(MeSamp1000_means, MeSamp1000_errors, [], groupnames, bw_title, [], [], [], 'none', [], 1, 'plot');
    handles.ax = ax(9);
        
   
%Makes all axes have the same scale as the first listed axes
linkaxes([ax(1) ax(2) ax(3) ],'y');
linkaxes([ax(4)  ax(5) ax(6)],'y');
linkaxes([ax(7) ax(8) ax(9)],'y');

%%
%Plot the boxplot of the  averages
figure; 
groupnames = {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'};

ax(1)=subplot(3,3,1);
boxplot(ax(1),Citrate200_means',groupnames);
ax(2)=subplot(3,3,2)
boxplot(ax(2),Citrate500_means',groupnames);
ax(3)=subplot(3,3,3)
boxplot(ax(3),Citrate1000_means',groupnames);
ax(4)=subplot(3,3,4)
boxplot(ax(4),PPack200_means',groupnames);
ax(5)=subplot(3,3,5)
boxplot(ax(5),PPack500_means',groupnames);
ax(6)=subplot(3,3,6)
boxplot(ax(6),PPack1000_means',groupnames);
ax(7)=subplot(3,3,7)
boxplot(ax(7),MeSamp200_means',groupnames);
ax(8)=subplot(3,3,8)
boxplot(ax(8),MeSamp500_means',groupnames);
ax(9)=subplot(3,3,9)
boxplot(ax(9),MeSamp1000_means',groupnames);


%Makes all axes have the same scale as the first listed axes
linkaxes([ax(1) ax(2) ax(3) ],'y');
linkaxes([ax(4)  ax(5) ax(6)],'y');
linkaxes([ax(7) ax(8) ax(9)],'y');

%%
%Plot  data
figure;
ax(1)=subplot(3,3,1);
plotSpread(ax(1),nancat(2,Citrate(:,1:3:15)), ...
    'xNames', {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'},'distributionMarkers', {'+'});
ax(2)=subplot(3,3,2);
plotSpread(ax(2),nancat(2,Citrate(:,2:3:15)), ...
    'xNames', {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'},'distributionMarkers', {'+'});
ax(3)=subplot(3,3,3);
plotSpread(ax(3),nancat(2,Citrate(:,3:3:15)), ...
    'xNames', {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'},'distributionMarkers', {'+'});
ax(4)=subplot(3,3,4);
plotSpread(ax(4),nancat(2,PPack(:,1:3:15)), ...
    'xNames', {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'},'distributionMarkers', {'+'});
ax(5)=subplot(3,3,5);
plotSpread(ax(5),nancat(2,PPack(:,2:3:15)), ...
    'xNames', {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'},'distributionMarkers', {'+'});
ax(6)=subplot(3,3,6);
plotSpread(ax(6),nancat(2,PPack(:,3:3:15)), ...
    'xNames', {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'},'distributionMarkers', {'+'});
ax(7)=subplot(3,3,7);
plotSpread(ax(7),nancat(2,MeSamp(:,1:3:15)), ...
    'xNames', {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'},'distributionMarkers', {'+'});
ax(8)=subplot(3,3,8);
plotSpread(ax(8),nancat(2,MeSamp(:,2:3:15)), ...
    'xNames', {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'},'distributionMarkers', {'+'});
ax(9)=subplot(3,3,9);
plotSpread(ax(9),nancat(2,MeSamp(:,3:3:15)), ...
    'xNames', {'Control';'0.4'; '0.4 + ODQ'; '6.8'; '6.8 + ODQ'},'distributionMarkers', {'+'});

%Makes all axes have the same scale as the first listed axes
linkaxes([ax(1) ax(2) ax(3) ],'xy');
linkaxes([ax(5)  ax(4) ax(6)],'xy');
linkaxes( [ax(7) ax(8) ax(9)],'xy');

