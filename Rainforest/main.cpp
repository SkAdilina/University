#include<iostream>
#include <fstream>
#include <string>
#include <sstream>
#include<map>
#include<vector>
using namespace std;

int main()
{
    ifstream input;
    int i,j,n,number_data;
    string st,st1;
    stringstream ss(st);
    //input.open( "./dataset/w.txt" );
    //input.open( "./dataset/HIGGS.txt" );
    //input.open( "./dataset/parkinson.txt" );
    input.open( "./dataset/dota2.txt" );
    
    string line[30010],test,attname;
    map<string,int>::iterator it,temp,it1;
    map<string,int> dataset[30100];
    map<string,int> pos[30100];
    map<string,string> final;
    map<string,string>::iterator temp1;
    i=0;
    vector<string> a[30100];
    vector<double> gini_index;
    string label;

    input >> line[i]; // if attribute name row present
    i++;
    while ( !input.eof() )
    {
        input >> line[i];
        //cout<<line[i]<<endl;
        i++;
    }
    n=i;
    for(i=1;i<=n;i++)
    {
        st='\0';
        for(j=0;j!=line[i].size();j++)
        {
            if(line[i][j]!=',')
                st+=line[i][j];
            else
            {
                a[i].push_back(st);
                st='\0';
            }
        }
        a[i].push_back(st);
        st='\0';
        j=(a[i].size())-1;//class label
    }

    for(i=1;i<n;i++)
    {
        //it=dataset[i].begin();
        for(j=0;j<a[i].size();j++)
        {

            it=dataset[j].begin();

            if(i==0)
            {
                dataset[j].insert(it,pair<string,int>(a[i][j],-1));

            }
            else
            {

                temp=dataset[j].find(a[i][j]);
                if(temp!=dataset[j].end())
                {
                    temp->second=temp->second+1;


                }
                else
                {
                    dataset[j].insert(it,pair<string,int>(a[i][j],1));

                }

            }

        }
    }
    for(i=1;i<n;i++)
    {
        test=a[i][(a[i].size())-1];
        //cout<<(test[1]=='y')<<' ';
        //cout<<i<<'='<<a[i].size()-1<<' ';
        for(j=0;j<a[i].size()-1;j++)
        {
            it=pos[j].begin();
            if(i==0)
            {
                if(test[1]=='y')
                {
                    pos[j].insert(it,pair<string,int>(a[i][j],1));
                    //cout<<"true\n";
                }
                else
                {
                    pos[j].insert(it,pair<string,int>(a[i][j],0));
                    //cout<<"false\n";
                }
            }
            else
            {

                temp=pos[j].find(a[i][j]);
                if(temp!=pos[j].end())
                {
                    if(test[1]=='y')
                        temp->second=temp->second+1;
                }
                else
                {

                    if(test[1]=='y')
                        pos[j].insert(it,pair<string,int>(a[i][j],1));
                    else
                        pos[j].insert(it,pair<string,int>(a[i][j],0));
                }

            }

        }
    }
    int count=0,pcount=0;
    for(j=0;j<n;j++)
    {
        count=0;
        //for(it=dataset[j].begin();it!=dataset[j].end();it++)
        for(it=pos[j].begin();it!=pos[j].end();it++)
        {

            //cout<<it->first<<' '<<it->second<<'\n';
            count++;

        }
        if(count>0)
         pcount++;

    }
    j=pcount;
    double gini_d=0,gini_att=0,val,total;
    n--;
    for(it=dataset[j].begin();it!=dataset[j].end();it++)
    {
        val=it->second;
        //cout<<n<<endl;
        gini_d+=(val/n)*(val/n);
    }
    gini_d=1-gini_d;
    //cout<<gini_d<<'\n';
    count=0;
    gini_att=0;
    for(j=0;j<pcount;j++)
    {
         double val1,val2;
        it=dataset[j].begin();
        total=0;
        for(it1=pos[j].begin();it1!=pos[j].end();it1++,it++)
        {
            total=0;

            //cout<<"it: "<<it->first<<' '<<it->second<<'\n';
            //cout<<"it1: "<<it1->first<<' '<<it1->second<<'\n';
            val1=it1->second;
            val2=it->second;
            total+=(val1/val2)*(val1/val2);
            total+=((val2-val1)/val2)*((val2-val1)/val2);
            total=1-total;
            //cout<<total<<'\n';
            gini_att+=((val2/n)*total);



        }

        //cout<<"break\n";
        //cout<<gini_att<<'\n';
        gini_index.push_back(gini_d-gini_att);
        gini_att=0;
    }
    int root;
    double m;
    for(j=0;j<pcount;j++)
    {
        //cout<<gini_index[j]<<'\n';
        if(gini_index[j]>m)
        {
            m=gini_index[j];
            root=j;
        }
    }
    //cout<<root;
    it=dataset[root].begin();
    int val2,val1;
    temp1=final.begin();
    for(it1=pos[root].begin();it1!=pos[root].end();it1++,it++)
    {
            //cout<<"it: "<<it->first<<' '<<it->second<<'\n';
            //cout<<"it1: "<<it1->first<<' '<<it1->second<<'\n';
            val1=it1->second;
            val2=it->second;
            if(val2>(val1-val2))
                final.insert(temp1,pair<string,string>(it->first,"yes"));
            else
                final.insert(temp1,pair<string,string>(it->first,"no"));
     }
    /*for(temp1=final.begin();temp1!=final.end();temp1++)
    {
        cout<<temp1->first<<' '<<temp1->second<<'\n';
     }*/
    j=root;
    //int cl=4;
    int cl=28; //HIGGS
    //int cl=26; //Parkinsons tp: 520 fp: 519 n: 1040
    //int cl=116; //DOTA2 tp: 15815 fp: 14183 n: 29999
    temp1=final.begin();
    double tp=0,fp=0,tn=0,fn=0;
    //cout<<(0.7*n)<<' '<<(0.3*n)<<'\n';
    for(i=1;i<=n;i++)
    {
        //cout<<a[i][j]<<' '<<a[i][cl]<<'\n';
        st=a[i][cl];
        temp1=final.find(a[i][j]);
        st1=temp1->second;
        //cout<<st1<<' '<<st<<' ';

        if(st1[0] == st[1])
        {
            if(st1[0]=='y')
                tp++;
            else if(st1[0]=='n')
                tn++;
            //cout<<"match\n";
        }
        else
        {
            if(st1[0]=='y')
                fp++;
            else if(st1[0]=='n')
                fn++;
            //cout<<"non match\n";
        }
    }
    if((tp==0)||(tn==0))
    {
        tp++;
        tn++;
    }
    if((fp==0)||(fn==0))
    {
        fp++;
        fn++;
    }
    //cout<<"tp: "<<tp<<" fp: "<<fp<<" n: "<<n<<'\n';
    double acc;
    acc=((tp+tn)/(tp+tn+fn+fp))*100;
    cout<<"Accuracy: "<<acc<<" %\n";
    cout<<"Error rate: "<<100-acc<<" %\n";
    double recall=(tp/(tp+fp));
    cout<<"Sensitivity/Recall: "<<recall<<" \n";
    cout<<"Specificity: "<<(tn/(tn+fn))<<" \n";
    cout<<"Precision: "<<(tp/(tp+fp))<<" \n";
    double fscore;
    fscore=(tp/(tp+fp))*2*(tp/(tp+fp));
    fscore=fscore/((tp/(tp+fp))+(tp/(tp+fp)));
    cout<<"F-score: "<<fscore<<" \n";
    return 0;
}
