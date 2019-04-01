%%      Lloyd-Mahist Algorithm
function output=LMAhist(hist)
for q=1:3%%no. of bits
    n_bits = q;
    q_levels = 2^n_bits;%% no of levels
    minv = 0;%% dynamic range
    mahistv = 1;
    len=(-1*minv+mahistv)/q_levels;%%length of interval
    m=zeros(1,q_levels+1);
    for i=1:q_levels+1
        m(i)=minv+(i-1)*len;%%initialize
    end
    
    sig=hist;
    sig=sort(sig);
    lu=zeros(1,q_levels);
    sk=zeros(1,q_levels);
    for i=1:100%%iterations
        for k=1:q_levels
            [sk(k),lu(k)]=cent(m(k),m(k+1),sig,k,q_levels);
            new(k)=sk(k)/lu(k);%%centroid
        end
        for k=2:q_levels
            m(k)=(new(k-1)+new(k))/2;%%new intervals
        end
        for h=1:q_levels%%MSE calculation
            for t=1:80
                if(hist(t)<m(h+1) && hist(t)>=m(h))
                    Y(t)=new(h);
                end
            end
        end
        
        a=hist-Y;
        b=a.^2;
        mse1(i)=sum(b)/80;
    end
    %plot(mse1)
    hold on
end
output=Y;