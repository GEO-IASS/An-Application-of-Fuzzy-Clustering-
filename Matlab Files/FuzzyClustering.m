clc
clear all
x=[0.01:0.1*pi:2*pi];
y=sin(x)+0.1*rand(1);
plot(x,y)
hold on
data=[x',y'];
l=length(data);
plot(data(:,1), data(:,2),'o','color','g');
xlabel('x','fontweight','bold') 
ylabel('y=sin(x)+0.1*rand(1)','fontweight','bold')
disp('Enter the number of desired clusters');
n=input('');
[center,U]=fcm(data,n)
for b=1:n
    plot(center(b,1),center(b,2),'ko','LineWidth',2,'markersize',20);
end
t=input('Enter the desired threshold: ');
for i=1:n
    u(i,:)=U(i,:)>t;
    X(i,:)=u(i,:)'.*data(:,1);
    d=X(i,:)';
    d=d(d~=0);
    Y(i,:)=u(i,:)'.*data(:,2);
    e=Y(i,:)';
    e=e(e~=0);
    xl{i}=[d,ones(length(d),1)];
    theta{i}=((xl{i}'*xl{i})^-1)*xl{i}'*e;
    theta{i}
    hold on
    plot(d(d~=0), theta{i}(1)*d(d~=0)+theta{i}(2),'linewidth',2,'color','r');
end
figure
hold on
for a=1:n
    plot(x,U(a,:));
end
for i=1:1:length(x)
    for b=1:n
       B(b,1)= theta{b}(1)*x(i)+theta{b}(2);
    end
 y(1,i)=U(:,i)'*B;
 yh=y/sum(U(:,i));
  
end
figure
plot(x,yh);

 