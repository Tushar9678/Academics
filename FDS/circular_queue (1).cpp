
#include <iostream>
using namespace std;
int MAX=5;
class PizzaParlour
{
     int front,rear;
     int orders[5];
     public:
                PizzaParlour()
                { 
                    front = rear = -1;
                }
                bool add_Order(int data);
                void serve_Order();
                void display();
} ;
bool PizzaParlour::add_Order(int data)
{
    if(rear== -1)
    {
        front = rear = 0;
        orders[rear]=data;
        return true;
    }
    else
    {
        int pos=(rear+1)%MAX;
        if(pos==front)
        {
            cout<<"\ncafe is FULL._______Please wait.\n";
            return false;           
        }
        else
        {
             rear=pos;
             orders[rear]=data;
             return true;
        }
    }
}
void PizzaParlour::serve_Order()
{
     if(front == -1)
     {
          cout<<"\n No orders In cafe(CAFE IS EMPTY)\n";
          return;
     }
     else
     {
          cout<<"\n Order NO."<<orders[front]<<"is proccesed\n";
          if(front == rear)//only onr order
          {
               front = rear= -1;
          }
          else
          {
             front=(front+1)%MAX;
          }
     }
}
void PizzaParlour::display()
{
   int i=0;
   if(front == -1)
   {
       cout<<"\n cafe id Empty , NO ORDERS.\n";
       return ;
       
   }
   else
   {
       cout<<"order ID,s:\n";
       for(i = front; i!=rear ; i=((i+1)%MAX))
       {
            cout<<orders[i]<<" ";
            
       }
       cout<<orders[rear];
   }
}
void intro()
{
    char name[50]={"\n CAFE OF HAPPINESS\n"};
    for(int i=0;name[i]!='\0';i++)
    {
         cout<<name[i];
         
    }
}
int main()
{
      int ch,id=0;
         PizzaParlour q;
         do{
                cout<<"n--------------------------------------------------------";
                intro();
                cout<<"-----------------------------------------------------";
                cout<<"\n****MENU*** "<<endl;
                cout<<"1.Accept Order"<<endl;
                cout<<"2.serve Order"<<endl;
                cout<<"3.Display Orders"<<endl;
                
                cout<<"enter choice :";
                cin>> ch;
                
                switch(ch)
                {
                 case 1: id++;
                            if(q.add_Order(id))
                            {
                            cout<<"thank you for Order.Order id is :"<<id;
                            }
                            else
                            {
                            id--;
                            }
                            break;
                            
                case 2: q.serve_Order();
                           break;
               case 3: q.display();
                          break;
                  }
                  
          }while(ch!=4);
          cout<<"\n thank you : ). keep visiting."<<endl;

}
