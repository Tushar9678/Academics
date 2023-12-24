#include <iostream>
using namespace std;
#define siz 50

class Stack{
    public:
    int top;
    char arr[siz];

    Stack()
    {
        top = -1;
    }

    void push(char c) {
        if(top >= siz)
        {
            cout<<"Stack is overflow"<<endl;
        }
        else
        {
            arr[++top] = c;
        }
    }  

    char pop()
    {
        if(top == -1)
        {
            cout<<"Stack is underflow"<<endl;
        }
        else{
            return arr[top--];
        }
    }

    void display()
    {
        for(int i =top; i>=0; i--)
        {
            cout<<arr[i]<<endl;
        }
    }

};


int main()
{
    Stack s;
    string original;
    string str;
    cout<<"Enter a string : ";
    getline(cin,str);

    for(int i=0; i<=str.size(); i++)
    {
        char ch = str[i];

        if(ch >= 'a' and ch<='z')
        {
            ch = (char)(ch - 'a' + 'A');
        }
        if(ch >='A' and ch <= 'Z')
        {
            s.push(ch);
            original.push_back(ch);
        }
    }
    
    cout<<"Original string : "<<original<<endl;

    string rev;
    while(s.top != -1)
    {
        rev.push_back(s.pop());
    }
    cout<<"Reversed string : "<<rev<<endl;

    bool ispalindrome = true;
    for(int i =0; i< original.size(); i++)
    {
        if(original[i]!=rev[i])
        {
            ispalindrome = false;
            break;
        }
    }

    cout<<"' "<<str<<" ' "<<"is"<<(ispalindrome? " ":" not ")<<"a"<<" Palindrome"<<endl; 

}
