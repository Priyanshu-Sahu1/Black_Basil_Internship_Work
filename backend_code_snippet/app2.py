import pymongo
import json
from pymongo import MongoClient
from flask import Flask, jsonify
from bson import json_util, ObjectId

# from flask import Flask
app=Flask(__name__)
# import pymongo;

# from pymongo import MongoClient

cluster=MongoClient("mongodb+srv://user:priyanshu@cluster0.sj5lg7l.mongodb.net/?retryWrites=true&w=majority")
db=cluster["sales"]
collection=db["salesData"]
# cluster=MongoClient("mongodb+srv://root:root@cluster0.07wtzrc.mongodb.net/?retryWrites=true&w=majority")
# db=cluster["Test2"]
# collection=db["Student2"]

@app.route('/armstrong')
def hello_world():
    return jsonify({'Hello,  World'})


@app.route('/totaluser')
def countuser():
    x=json.loads(json_util.dumps(collection.find()))
    # ans2='{'
    
    ans = []
    records={
         "name" : len(x) ,
    }
    ans.append(records)
    ans2={
         "records" : ans
    }
    # ans2.append('}')
    return jsonify(records)
    # records = {"name" : len(x)}
    # return jsonify(records)   

@app.route('/user/<int:n>')
def armstrong(n):
  
    sum1 = 1
    
    copy_n=1
     
    # x = collection.find()
    
    # collection.insert_one(result)
    # x =collection.find({}).toArray().then((ans) => {
    #     console.log(ans);
    # })
    # str="records :"
    # ans1='{'
    # ans1.append(str)
    ans = []
    # x=collection.find()
    # print(x)
    y=json.loads(json_util.dumps(collection.find()))
    hm = {}
    print("heelo")
    i = 0
    while (i < len(y)):
        hm[i]=y[i]['_id']
        i = i + 1
        print("Hello Geek")
    print(hm[n])
    print("bye")
    str=hm[n]
    print(str['$oid'])
    z=json.loads(json_util.dumps(collection.find({"_id" : ObjectId(str['$oid'])})))
    # if(n==0):
    #     print(n)
      
    # if(n==1):
    #     print(n)
    #     x=json.loads(json_util.dumps(collection.find({"_id" : ObjectId('63e233b023eb7a0aa6bf8dbe')}))) 
    # if(n==2):
    #     print(n)
    #     x=json.loads(json_util.dumps(collection.find({"_id" : ObjectId('63e233b8ec58cc6305becf6a')})))   

    # for data in x:
    #     ans.append(data)
      
    # print(ans[1]['name'])  
    # print(len(ans))  
    # for fd in x:
    #     print(fd.pop('_id'))
      
    # print(len(ans))
    # print(ans[0]['salesData'][0])
    # print("------------------==-=-=-=-=-=--==-=-==-=-=-====================================================================================")
    # # print(ans[1])
    # print("--------------------------------------------------------------------------------------------------------------------------------")
    # print(len(ans[0]['salesData']))
    # print(ans[0]['salesData'])
    # print(ans[2])
    # ans1.append(ans)
    # ans1.append('}') 
    # ans2={
    #     "records" : ans
    # }
    

    # collection.insert_one(result)
    # records={
    #      "name" : "vikas" ,
    #     "lastname" : "paswan" ,
    #     "age" : 13,
    # }
    # return jsonify(ans)
    # del board[:]
    # board.append(ans)
    # print(board) 
    # jsonStr = json.dumps([obj._dict_ for obj in ans])
# print(jsonStr)
    # print(len(x))
    return jsonify(z)
if __name__ == "__main__":
    app.run(port=7777,debug=True)