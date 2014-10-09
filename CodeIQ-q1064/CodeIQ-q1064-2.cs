using System;
using System.Collections.Generic;

class Person : IComparable<Person>
{
    string name;
    int scoreOfTest;
    int age;
    public Person(String name,int scoreOfTest, int age) 
    {
        this.name = name;
        this.scoreOfTest = scoreOfTest;
        this.age = age;
    }
    public void show()
    {
        Console.Write(name + " ");
    }
    public int CompareTo(Person other)
    {
        return -(this.scoreOfTest - other.scoreOfTest);
    }
    int IComparable<Person>.CompareTo(Person other)
    {
        return this.age - other.age;
    }
}

public class Test
{
	public static void Main()
	{
		List<Person> list = new List<Person>();
        list.Add(new Person("Aaron", 60, 18));
        list.Add(new Person("Barnaby", 54, 12));
        list.Add(new Person("Cody", 84, 8));
        list.Add(new Person("Deanna", 72, 10));
        list.Add(new Person("Emily", 92, 15));
        list.Sort();
        foreach (Person ps in list)
        {
            ps.show();
        }
	}
}