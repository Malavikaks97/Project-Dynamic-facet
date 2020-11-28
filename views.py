from django.shortcuts import render,redirect,render_to_response,HttpResponseRedirect
from django.db import connection
from django.http import HttpResponse
from django.template import Context
from django.db import models
from dynamic.forms import ItemForm
from dynamic.models import Item
from django.template.loader import get_template
from django.template import Template, Context
from  datetime import date 
from datetime import datetime
now = date.today()
today=date.today()
from django.http import HttpResponse
from django.views.generic import View

#from dynamic.utils import render_to_pdf

def download(request):
	cursor=connection.cursor()
	oid=request.GET['oid']
	uid=request.session['uid']
	sql="select * from item1 INNER JOIN orderitem ON item1.itemid=orderitem.itemid where orderitem.uid='%d' and orderitem.oid='%s' "%(uid,oid)
	cursor.execute(sql)
	result1=cursor.fetchall()
	list=[]
	gtamt=0.0
	for row1 in result1:
		tamt=(float(row1[11])*float(row1[12]))
		w1={'itemid':row1[0],'itemname':row1[1],'image':row1[7],'qty1':row1[11],'amt1':row1[12],'tamt':tamt}
		list.append(w1)
		gtamt=gtamt+tamt
	tax=(float(gtamt)*18)/100.0
	taxgamt=gtamt+tax
	sql="select * from register where uid='%s' "%(request.session['uid'])
	cursor.execute(sql)
	result=cursor.fetchall()
	user=[]
	for row in result:
		w={'uid':row[0],'uname':row[1],'email':row[2],'addr':row[3],'phone':row[4]}
		user.append(w)
	'''data = {
             'today': datetime.date.today(), 
             'amount': 39.99,
            'customer_name': 'Cooper Mann',
            'order_id': 1233434,
        }'''
        pdf = render_to_pdf('invoice.html', {'list':list,'user':user,'oid':oid,'gtamt':gtamt,'tax':tax,'taxgamt':taxgamt,'today':today})
	return HttpResponse(pdf, content_type='application/pdf')

def loginload(request):
	return render(request,'login.html')

def searchload(request):
	return render(request,'homeuser.html')

def adminload(request):
	return render(request,'adminhome.html')

def uload(request):
	return render(request,'userhome.html')
	
def contactload(request):
	return render(request,'contact.html')
	
def searchlogin(request):
	cursor=connection.cursor()
	p=request.GET['username']
	q=request.GET['password']
	sql2="select * from login where uname='%s' and password='%s'" %(p,q)
	cursor.execute(sql2)
	result=cursor.fetchall()
	if 	(cursor.rowcount) > 0:
		sql3 = "select * from login  where uname='%s' and password='%s'" % (p, q)
		cursor.execute(sql3)
		result1 = cursor.fetchall()
		for row1 in result1:
			request.session['username'] = row1[0]
			request.session['uid'] = row1[2]
			request.session['utype'] = row1[3]
		if(request.session['utype']=='admin'):
			html="<script>alert('login succesfull ');window.location='/adminhome/';</script>"
		elif(request.session['utype']=='user'):
			html="<script>alert(' user login succesfull ');window.location='/userhomes/';</script>"	
	else:
		html="<script>alert('invalid password and username ');window.location='/home/';</script>"
	return HttpResponse(html)
def logout(request):
	try:
		del request.session['uid']
		del request.session['utype']
	except:
		pass
	return HttpResponse("<script>alert('you are loged out');window.location='/home/';</script>")
def userload(request):
	return render(request,'register.html')
def adminhome(request):
	return render(request,'adminhome.html',{'utype':request.session['username']})
def userhomes(request):	
	cursor=connection.cursor()
	sql="select * from category"
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'ccode':row[0],'cname':row[1]}
		list.append(w)
	item=[]
	sql1="select * from item1 ORDER BY itemid DESC LIMIT 9"
	cursor.execute(sql1)
	result1=cursor.fetchall()
	for row1 in result1:
		w1={'itemid':row1[0],'itemname':row1[1],'ccode':row1[2],'bid':row1[3],'price':row1[4],'des':row1[5],'qty':row1[6],'image':row1[7]}
		item.append(w1)
	sugg=[]
	
	'''sql2="select fname,fvalue from facet where  uid='%s' ORDER BY count  LIMIT 6 " %(request.session['uid'])
	cursor.execute(sql2)
	result2=cursor.fetchall()
	list2=[]
	for row2 in result2:
		sql3="select itemid from featuretbl  where  fname='%s' and fvalue='%s' " %(row2[0],row2[1])
		cursor.execute(sql3)
		result3=cursor.fetchall()
		for row3 in result3:
			sql4="select * from item1 where  itemid='%s' " %(row3[0])
			#sql="SELECT item1.*, category.cname FROM item1 INNER JOIN category ON table2.name LIKE CONCAT('%', table1.name, '%') AND table1.year = table2.year
			cursor.execute(sql4)
			result4=cursor.fetchall()
			for row in result4:
					w={'itemid':row[0],'itemname':row[1],'ccode':row[2],'bid':row[3],'price':row[4],'des':row[5],'qty':row[6],'image':row[7]}
					sugg.append(w)'''
	items=[]
	s8="select property from propertytbl where  uid='%s' order by pscore desc" %(request.session['uid'])
	cursor.execute(s8)
	f8=cursor.fetchall()
	for r8 in f8:
		sql2="select fvalue from facet where disjiontpro=(select  max(disjiontpro) from facet where  uid='%s' and fname='%s')" %(request.session['uid'],r8[0])
		cursor.execute(sql2)
		#return HttpResponse(sql2)
		result2=cursor.fetchall()
		for row2 in result2:
			sql3="select itemid from featuretbl  where  fname='%s' and fvalue='%s' ORDER BY itemid  LIMIT 6  " %(r8[0],row2[0])
			cursor.execute(sql3)
			result3=cursor.fetchall()
			for row3 in result3:
				if row3[0]  not in items :
					items.append(row3[0])
	for item1 in items:			
		sql4="select * from item1 where  itemid='%s' " %(item1)
		cursor.execute(sql4)
		result4=cursor.fetchall()
		for row in result4:
			w={'itemid':row[0],'itemname':row[1],'ccode':row[2],'bid':row[3],'price':row[4],'des':row[5],'qty':row[6],'image':row[7]}
			sugg.append(w)
	user="select uname  from register where  uid='%s' " %(request.session['uid'])
	cursor.execute(user)
	u1=cursor.fetchall()
	list2=[]
	for u2 in u1:	
		uname=u2[0]
	return render(request,'userhomes11.html',{'list':list,'sugg':sugg,'item':item,'uname':uname})
def useraction(request):
	cursor=connection.cursor()
	uname=request.GET['uname']
	email=request.GET['email']
	addr=request.GET['address']
	phone=request.GET['phone']
	gender=request.GET['gender']
	password=request.GET['password']
	sql2="select * from login where uname='%s'" %(email)
	cursor.execute(sql2)
	result=cursor.fetchall()
	if 	(cursor.rowcount) > 0:
		h="<script>alert('already registerd');window.location='/home/';</script>"
	else:
		sql1="insert into register(uname,email,addr,phone,gender)values('%s','%s','%s','%s','%s')"%(uname,email,addr,phone,gender)
		cursor.execute(sql1)
		sql2="select max(uid) from register"
		cursor.execute(sql2)
		result=cursor.fetchall()
		list=[]
		for row in result:
			uid=row[0]
		sql3="insert into login(uname,uid,utype,password)values('%s','%s','%s','%s')"%(email,uid,'user',password)
		cursor.execute(sql3)
		h="<script> alert('successfully Registered');window.location='/home/';</script>"
	return HttpResponse(h)
	
def catload(request):
	cursor=connection.cursor()
	sql="select * from category"
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'ccode':row[0],'cname':row[1]}
		list.append(w)
	return render(request,'category.html',{'list':list})
	#return render(request,'category.html')
	
def cataction(request):
	cursor=connection.cursor()
	#ccode=request.GET['ccode']
	cname=request.GET['cname']
	sql="insert into category(cname)values('%s')"%(cname)
	cursor.execute(sql)
	h="<script> alert('success');window.location='/cat/';</script>"
	return HttpResponse(h)
	
def brandload(request):
	cursor=connection.cursor()
	sql="select * from brand"
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'bid':row[0],'bname':row[1]}
		list.append(w)
	return render(request,'brand.html',{'list':list})
	#return render(request,'brand.html')
	
def brandaction(request):
	cursor=connection.cursor()
	bname=request.GET['bname']
	sql="insert into brand(bname)values('%s')"%(bname)
	cursor.execute(sql)
	h="<script> alert('success');window.location='/br/';</script>"
	return HttpResponse(h)

def itemload(request):
	cursor=connection.cursor()
	#ccode=request.GET['ccode']
	sql="select * from category "
	cursor.execute(sql)
	result=cursor.fetchall()
	cat=[]
	for row in result:
		w={'ccode':row[0],'cname':row[1]}
		cat.append(w)
	sql="select * from brand"
	cursor.execute(sql)
	result1=cursor.fetchall()
	brand=[]
	for row1 in result1:
		w1={'bid':row1[0],'bname':row1[1]}
		brand.append(w1)
	return render(request,'item.html',{'cat':cat,'brand':brand,'cat':cat})
	
def itemaction(request):
	html = ""
	cursor=connection.cursor()
	'''itemname=request.GET['itemname']
	ccode=request.GET['ccode']
	bname=request.GET['bname']
	price=request.GET['price']
	des=request.GET['des']'''
	qty=int(request.POST['qty'])
	itemname=request.POST['itemname']
	sql="select * from item1 where itemname=('%s')"%(itemname)
	cursor.execute(sql)
	result=cursor.fetchall()
	if (cursor.rowcount > 0):
		for row in result:
			q=int(row[6])
			itemid=row[0]
		q1=q+qty
		sql1="update item1 set qty=('%d') where itemname=('%s')" %(q1,itemname)
		cursor.execute(sql1)
		html = "<script>alert('successfully updated items!');window.location='/feature/?itemid=%s';</script>"%(itemid) 
	else:
		saved = False
		if request.method == "POST":
			MyItemForm = ItemForm(request.POST, request.FILES)
			if MyItemForm.is_valid():
				item = Item()
				item.itemname = MyItemForm.cleaned_data["itemname"]
				item.ccode = MyItemForm.cleaned_data["ccode"]
				item.bname = MyItemForm.cleaned_data["bname"]
				item.price = MyItemForm.cleaned_data["price"]
				item.des = MyItemForm.cleaned_data["des"]
				item.qty = MyItemForm.cleaned_data["qty"]
				item.image = MyItemForm.cleaned_data["image"]
				item.save()
				sql="select max(itemid) from item1"
				cursor.execute(sql)
				result=cursor.fetchall()
				l=[]
				for row in result:
					itemid=row[0]
				html = "<script>alert('successfully added! ');window.location='/feature/?itemid=%s';</script>"%(itemid) 
				saved = True
		else:
			MyItemForm = ItemForm()
	return HttpResponse(html)
	#sql="insert into item(itemname,ccode,bid,price,des,qty)values('%s','%s','%s','%s','%s','%s')"%(iname,cat,brand,price,des,qty)
	#cursor.execute(sql)
	#h="<script> alert('success');</script>"
	#return HttpResponse(h)

def viewcategory(request):
	cursor=connection.cursor()
	sql="select * from category"
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'ccode':row[0],'cname':row[1]}
		list.append(w)
	return render(request,'categoryview.html',{'list':list})
	
def deleteaction(request):
	cursor=connection.cursor()
	id=request.GET['id']
	sql="delete from category where ccode='%s'"%(id)
	cursor.execute(sql)
	h="<script> alert('deleted');window.location='/cat/';</script>"
	return HttpResponse(h)
def deleteproduct(request):
	cursor=connection.cursor()
	id=request.GET['id']
	sql="delete from item1 where ccode='%s'"%(id)
	cursor.execute(sql)
	h="<script> alert('deleted');</script>"
	return HttpResponse(h)
def deleteaction1(request):
	cursor=connection.cursor()
	s=request.GET['id']
	sql="delete from brand where bid='%s'"%(s)
	cursor.execute(sql)
	h="<script> alert('deleted');window.location='/br/';</script>"
	return HttpResponse(h)
	
def deleteaction2(request):
	cursor=connection.cursor()	
	t=request.GET['id']
	sql="delete from item1 where itemid='%s'"%(t)
	cursor.execute(sql)
	h="<script> alert('deleted');window.location='/viewitem/'</script>"
	return HttpResponse(h)

def deletecart(request):
	cursor=connection.cursor()	
	t=request.GET['id']
	sql="delete from cart where cartid='%s'"%(t)
	cursor.execute(sql)
	h="<script> alert('deleted');window.location='/viewcart/';</script>"
	return HttpResponse(h)
	
def viewbrand(request):
	cursor=connection.cursor()
	sql="select * from brand"
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'bid':row[0],'bname':row[1]}
		list.append(w)
	return render(request,'brandview.html',{'list':list})
	
def viewitem(request):
	cursor=connection.cursor()
	sql="select * from item1"
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'itemid':row[0],'itemname':row[1],'ccode':row[2],'bid':row[3],'price':row[4],'des':row[5],'qty':row[6],'image':row[7]}
		list.append(w)
	return render(request,'itemview.html',{'list':list})
def viewitemall(request):
	cursor=connection.cursor()
	sql="select * from item1"
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'itemid':row[0],'itemname':row[1],'ccode':row[2],'bid':row[3],'price':row[4],'des':row[5],'qty':row[6],'image':row[7]}
		list.append(w)
	return render(request,'itemviewall.html',{'list':list})
def viewitem1(request):
	cursor=connection.cursor()
	sql="select * from item1"
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'itemid':row[0],'itemname':row[1],'ccode':row[2],'bid':row[3],'price':row[4],'des':row[5],'qty':row[6],'image':row[7]}
		list.append(w)
	return render(request,'itemview1.html',{'list':list})
def product_view(request):
	cursor=connection.cursor()
	id=request.GET['id']
	sql="select * from item1 where itemid='%s'" %(id)
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'itemid':row[0],'itemname':row[1],'ccode':row[2],'bid':row[3],'price':row[4],'des':row[5],'qty':row[6],'image':row[7]}
		list.append(w)
	sql2="select * from featuretbl where itemid='%s'" %(id)
	cursor.execute(sql2)
	result1=cursor.fetchall()
	f=[]
	for row1 in result1:
		w={'itemid':row1[0],'fname':row1[1],'fvalue':row1[2],'fid':row1[3]}
		f.append(w)
	return render(request,'product_view.html',{'list':list,'f':f})
def category_product_view(request):
	cursor=connection.cursor()
	id=request.GET['cat']
	sql="select * from item1 where ccode='%s'" %(id)
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'itemid':row[0],'itemname':row[1],'ccode':row[2],'bid':row[3],'price':row[4],'des':row[5],'qty':row[6],'image':row[7]}
		list.append(w)
	sql2="select distinct(bname) from item1 where ccode='%s'" %(id)
	cursor.execute(sql2)
	result1=cursor.fetchall()
	b=[]
	for row1 in result1:
		w1={'bname':row1[0]}
		b.append(w1)
	return render(request,'product_view_user_cat.html',{'list':list,'b':b,'cat':id})
def cat_brand__product_view(request):
	cursor=connection.cursor()
	id=request.GET['cat']
	br=request.GET['br']
	sql="select * from item1 where ccode='%s' and bname='%s'" %(id,br)
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'itemid':row[0],'itemname':row[1],'ccode':row[2],'bid':row[3],'price':row[4],'des':row[5],'qty':row[6],'image':row[7]}
		list.append(w)
	sql2="select distinct(bname) from item1 where ccode='%s'" %(id)
	cursor.execute(sql2)
	result1=cursor.fetchall()
	b=[]
	for row1 in result1:
		w1={'bname':row1[0]}
		b.append(w1)
	return render(request,'product_view_user_cat.html',{'list':list,'b':b,'cat':id})
def product_view_user(request):
	cursor=connection.cursor()
	id=request.GET['id']
	uid=request.session['uid']
	sql="select * from item1 where itemid='%s'" %(id)
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'itemid':row[0],'itemname':row[1],'ccode':row[2],'bid':row[3],'price':row[4],'des':row[5],'qty':row[6],'image':row[7]}
		list.append(w)
	sql2="select * from featuretbl where itemid='%s'" %(id)
	cursor.execute(sql2)
	result1=cursor.fetchall()
	f=[]
	for row1 in result1:
		w={'itemid':row1[0],'fname':row1[1],'fvalue':row1[2],'fid':row1[3]}
		f.append(w)
	so="select * from featuretbl where itemid='%s'"%(id)
	cursor.execute(so)
	res1=cursor.fetchall()
	for ro1 in res1:
		w0={'fname':ro1[1],'fvalue':ro1[2]}
		fname=ro1[1]
		fvalue=ro1[2]
		se="select * from facet where uid='%s' and fvalue='%s' and fname='%s'"%(uid,fvalue,fname)
		cursor.execute(se)
		res2=cursor.fetchall()
		if (cursor.rowcount>0):
			for ro2 in res2:
				count=ro2[3]
				count1=count+1
				squ="update facet set count='%s' where uid='%s'and fvalue='%s' and fname='%s'"%(count1,uid,fvalue,fname)
				cursor.execute(squ)
		else:
			sql3="insert into facet(fname,fvalue,count,uid)values('%s','%s','%s','%s')"%(fname,fvalue,'1',uid)
			cursor.execute(sql3)
	return render(request,'product_view_user.html',{'list':list,'f':f})

def viewitemsearchadmin(request):
	#cursor=connection.cursor()
	cursor=connection.cursor()
	#search=request.GET['s11']
	search=request.GET['s11']
	sql2="Select distinct a.itemid , a.*  from item1 a left join featuretbl b  on a.itemid = b.itemid where LOWER(CONCAT(a.ccode,' ',a.bname,' ',b.fname,' ' ,b.fvalue )) LIKE LOWER( '%%%s%%' ) " %(search)
	cursor.execute(sql2)
	list=[]
	result4=cursor.fetchall()
	for row in result4:
		w={'itemid':row[1],'itemname':row[2],'ccode':row[3],'bid':row[4],'price':row[5],'des':row[6],'qty':row[7],'image':row[8]}
		list.append(w)
	'''search=request.GET['s11']
	sql="select * from item1 where  itemname  LIKE '%s%%' or ccode   LIKE '%s%%' or  bname  LIKE '%s%%' " %(search,search,search)
	#sql="SELECT item1.*, category.cname FROM item1 INNER JOIN category ON table2.name LIKE CONCAT('%', table1.name, '%') AND table1.year = table2.year
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'itemid':row[0],'itemname':row[1],'ccode':row[2],'bid':row[3],'price':row[4],'des':row[5],'qty':row[6],'image':row[7]}
		list.append(w)
	#return HttpResponse(list)'''
	return render(request,'itemsearch.html',{'list':list})
	
def viewitemsearchuser(request):
	cursor=connection.cursor()
	search=request.GET['s11']
	sql="select * from item1 where  itemname  LIKE '%s%%' or ccode   LIKE '%s%%' or  bname  LIKE '%s%%' " %(search,search,search)
	#sql="SELECT item1.*, category.cname FROM item1 INNER JOIN category ON table2.name LIKE CONCAT('%', table1.name, '%') AND table1.year = table2.year
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'itemid':row[0],'itemname':row[1],'ccode':row[2],'bid':row[3],'price':row[4],'des':row[5],'qty':row[6],'image':row[7]}
		list.append(w)
	#return HttpResponse(list)
	return render(request,'itemsearch.html',{'list':list})
	
def viewitemsearch(request):
	cursor=connection.cursor()
	searchid=request.GET['search1']
	sql="select * from item1 where itemname like '%s%%' "%(searchid)
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'itemid':row[0],'itemname':row[1],'ccode':row[2],'bid':row[3],'price':row[4],'des':row[5],'qty':row[6],'image':row[7]}
		list.append(w)
	return render(request,'itemview.html',{'list':list})
	
def orderload(request):
	cursor=connection.cursor()
	itemid=request.GET['itemid']
	uid=request.session['uid']
	sql="select * from item1 where itemid='%s'"%(itemid)
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'itemid':row[0],'itemname':row[1],'image':row[7],'price':row[4]}
		list.append(w)
	return render(request,'order.html',{'list':list})
	
def orderaction(request):
	cur=connection.cursor()
	cur.execute("select * from orderitem")
	result1 = cur.fetchall()
	if 	(cur.rowcount) > 0:
		cur.execute("select max(oid) as oid from orderitem")
		result1 = cur.fetchall()
		for row1 in result1:
			oid =int(row1[0])+1
	else:
		oid=1
	uid=request.session['uid']
	cur.execute(("select * from item1 inner join cart on item1.itemid=cart.itemid where cart.uid='%s'") %(uid))
	result = cur.fetchall()
	for row in result:
		qty=int(request.GET['qty'+str(row[8])])
		cartid=row[8]
		qt=int(row[6])
		uid=row[10]
		itemid=row[9]
		amt1=row[4]
		nq=(qt-qty)
		if (qt>=qty):
			sql2="insert into orderitem (oid,uid,itemid,qty1,amt1,mode)  values('%s','%s','%s','%s','%s','%s') " %(oid,uid,itemid,qty,amt1,'NIL')
			cur.execute(sql2)
			sql3="update item1 set qty='%s' where itemid='%s'" %(nq,itemid)
			cur.execute(sql3)
			sql4="delete from cart where cartid='%s'" %(cartid)
			cur.execute(sql4)
			h="<script>window.location='/paymentload/?oid=%s';</script>"%(oid) 
		else:
			h="<script> alert('out of stock');window.location='/viewitem/';</script>"
	return HttpResponse(h)
	
	'''qty1=request.GET['qty1']
	qt2=int(qty1)
	#amt1=request.GET['amt1']
	#amt2=int(amt1)
	uid=request.session['uid']
	itemid=request.GET['itemid']
	sql="select * from item1 where  itemid=('%s')"%(itemid)
	cur.execute(sql)
	result1=cur.fetchall()
	for row in result1:
		qty=row[6]
		price=row[4]
	if(qty>=qt2):
		q=qty-qt2
		p=qt2*price
		s="update item1 set qty=('%d') where itemid=('%s')"%(q,itemid)
		cur.execute(s)
		sql1="insert into orderitem(qty1,amt1,uid,itemid) values('%d','%d','%d','%s') " %(qt2,p,uid,itemid)
		cur.execute(sql1)
		sql="select max(oid) from orderitem"
		cur.execute(sql)
		result=cur.fetchall()
		for row in result:
			oid=row[0]
		h="<script> alert('success');window.location='/paymentload/?oid=%s';</script>"%(oid)
	else:
		h="<script> alert('out of stock');window.location='/viewitem/';</script>"
	return HttpResponse(h)'''
		
def featureload(request):
	cursor=connection.cursor()
	itemid=request.GET['itemid']
	sql="select * from featuretbl where itemid='%s'"%(itemid)
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'itemid':row[0],'fname':row[1],'fvalue':row[2],'fid':row[3]}
		list.append(w)
	return render(request,'feature.html',{'list':list,'itemid':itemid})
	
def featureaction(request):
	cur=connection.cursor()
	itemid=request.GET['itemid']
	fname=request.GET['fname']
	fvalue=request.GET['fvalue']
	sql1="insert into featuretbl(itemid,fname,fvalue) values('%s','%s','%s') " %(itemid,fname,fvalue)
	cur.execute(sql1)
	html = "<script>alert('successfully added! ');window.location='/feature/?itemid=%s';</script>"%(itemid) 
	return HttpResponse(html)

def deleteaction3(request):
	cursor=connection.cursor()
	b=request.GET['id']
	sql="delete from featuretbl where fid='%s'"%(b)
	cursor.execute(sql)
	h="<script> alert('deleted');</script>"
	return HttpResponse(h)	
	
def paymentload(request):
	oid=request.GET['oid']
	return render(request,'payment.html',{'oid':oid})
	
def paymentaction(request):
	cursor=connection.cursor()
	mode=request.GET['selectmode']
	oid=request.GET['oid']
	if(mode=='Cash'):
		sql="update  orderitem set mode='Cash-on-Delivery'  where oid=('%s')"%(oid)
		cursor.execute(sql)
		h="<script> alert('successfully updated');window.location='/vieworder/?oid=%s';</script>"%(oid)
		return HttpResponse(h)	
	else:
		h="<script>window.location='/bankingload/?oid=%s';</script>"%(oid)
		return HttpResponse(h)	

def bankingload(request):
	oid=request.GET['oid']
	return render(request,'banking.html',{'oid':oid})

def bankingaction(request):
	cursor=connection.cursor()
	bank=request.GET['bank']
	#mode=request.GET['selectmode']
	oid=request.GET['oid']
	sql="update  orderitem set mode='Net-Banking' where oid=('%s')"%(oid)
	cursor.execute(sql)
	h="<script> alert('payment is successfull');window.location='/viewbill?oid=%s';</script>"%(oid)
	return HttpResponse(h)
def viewbill(request):
	cursor=connection.cursor()
	oid=request.GET['oid']
	uid=request.session['uid']
	sql="select * from item1 INNER JOIN orderitem ON item1.itemid=orderitem.itemid where orderitem.uid='%d' and orderitem.oid='%s' "%(uid,oid)
	cursor.execute(sql)
	result1=cursor.fetchall()
	list=[]
	gtamt=0.0
	for row1 in result1:
		tamt=(float(row1[11])*float(row1[12]))
		w1={'itemid':row1[0],'itemname':row1[1],'image':row1[7],'qty1':row1[11],'amt1':row1[12],'tamt':tamt}
		list.append(w1)
		gtamt=gtamt+tamt
	tax=(float(gtamt)*18)/100.0
	taxgamt=gtamt+tax
	sql="select * from register where uid='%s' "%(request.session['uid'])
	cursor.execute(sql)
	result=cursor.fetchall()
	user=[]
	for row in result:
		w={'uid':row[0],'uname':row[1],'email':row[2],'addr':row[3],'phone':row[4]}
		user.append(w)
	return render(request,'invoice.html',{'list':list,'user':user,'oid':oid,'gtamt':gtamt,'tax':tax,'taxgamt':taxgamt,'today':today})
'''def dowload(request):
	import pdfkit
	dt=TEMPLATE_DIRS
	#return HttpResponse(dt)
	
	pdfkit.from_file('D:/EXPLORIC-PROJECT-2020/dynamicfacet%20-new/dynamicfacet/templates/invoice.html', 'micro.pdf')'''
def vieworder(request):
	cursor=connection.cursor()
	#oid=request.GET['oid']
	oid=0
	uid=request.session['uid']
	sql="select * from item1 INNER JOIN orderitem ON item1.itemid=orderitem.itemid where orderitem.uid=('%d')"%(uid)
	cursor.execute(sql)
	result1=cursor.fetchall()
	list=[]
	for row1 in result1:
		w1={'itemid':row1[0],'itemname':row1[1],'image':row1[7],'qty1':row1[11],'amt1':row1[12]}
		list.append(w1)
	return render(request,'orderview.html',{'list':list,'oid':oid})	
	
def cart(request):
	cursor=connection.cursor()
	itemid=request.GET['itemid']
	uid=request.session['uid']
	sql="select * from cart where itemid='%s' and uid='%s'"%(itemid,uid)
	cursor.execute(sql)
	result=cursor.fetchall()
	if(cursor.rowcount>0):
		h="<script>alert('Already exists in cart ');window.location='/userhomes/';</script>"
	else:
		sql3 = "insert into cart(uid,itemid) values('%s','%s')" % (request.session['uid'],itemid)
		cursor.execute(sql3)
		h="<script>alert('Added to cart ');window.location='/userhomes/';</script>"
	return HttpResponse(h)

def viewcart(request):
	cursor=connection.cursor()
	uid=request.session['uid']
	sql="select * from item1 INNER JOIN cart ON item1.itemid=cart.itemid where  cart.uid='%s'"%(request.session['uid'])
	cursor.execute(sql)
	result1=cursor.fetchall()
	list=[]
	for row1 in result1:
		w1={'itemid':row1[0],'itemname':row1[1],'image':row1[7],'qty':row1[6],'price':row1[4],'cartid':row1[8]}
		list.append(w1)
	cursor.execute(("select count(*) as cnt from cart where uid='%s'") %(request.session['uid']))
	result2 = cursor.fetchall()
	for row2 in result2:
		 count =row2[0]
	return render(request,'cartview1.html',{'list':list,'count':count})
	
def viewfacet(request):
	cursor=connection.cursor()
	uid=request.session['uid']
	sql="select * from facet where uid=('%s')"%(uid)
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'fname':row[1],'fvalue':row[2],'count':row[3],'facetid':row[4]}
		list.append(w)
	cursor=connection.cursor()
	uid=request.session['uid']
	sql2="select * from item1 INNER JOIN featuretbl ON item1.itemid=featuretbl.itemid INNER JOIN facet ON featuretbl.fvalue=facet.fvalue and featuretbl.fname=facet.fname where facet.uid='%s'  GROUP BY item1.itemid  "%(request.session['uid'])
	cursor.execute(sql2)
	result1=cursor.fetchall()
	list1=[]
	for row1 in result1:
		w1={'itemid':row1[0],'itemname':row1[1],'des':row1[5],'image':row1[7],'qty':row1[6],'price':row1[4],'cartid':row1[8]}
		list1.append(w1)
	return render(request,'facetview.html',{'list':list,'list1':list1})
	
def deletefacet(request):
	cursor=connection.cursor()
	facetid=request.GET['id']
	sql="delete from facet where facetid='%s'"%(facetid)
	cursor.execute(sql)
	h="<script> alert('Removed');</script>"
	return HttpResponse(h)
	
def viewfacet1(request):
	cursor=connection.cursor()
	uid=request.session['uid']
	sql="select * from item1 INNER JOIN featuretbl ON item1.itemid=featuretbl.itemid INNER JOIN facet ON featuretbl.fvalue=facet.fvalue and featuretbl.fname=facet.fname where facet.uid='%s'"%(request.session['uid'])
	cursor.execute(sql)
	result1=cursor.fetchall()
	list=[]
	for row1 in result1:
		w1={'itemid':row1[0],'itemname':row1[1],'image':row1[7],'qty':row1[6],'price':row1[4],'cartid':row1[8]}
		list.append(w1)
	return render(request,'facetview.html',{'list':list})
'''def dynamicfacetsearch(request):
	cursor=connection.cursor()
	#search=request.GET['s11']
	list=[]
	sql2="select fname,fvalue from facet where  uid='%s' " %(request.session['uid'])
	cursor.execute(sql2)
	result2=cursor.fetchall()
	list2=[]
	for row2 in result2:
		sql3="select itemid from featuretbl  where  fname='%s' and fvalue='%s' " %(row2[0],row2[1])
		cursor.execute(sql3)
		result3=cursor.fetchall()
		for row3 in result3:
			sql4="select * from item1 where  itemid='%s' " %(row3[0])
			#sql="SELECT item1.*, category.cname FROM item1 INNER JOIN category ON table2.name LIKE CONCAT('%', table1.name, '%') AND table1.year = table2.year
			cursor.execute(sql4)
			result4=cursor.fetchall()
			for row in result4:
					w={'itemid':row[0],'itemname':row[1],'ccode':row[2],'bid':row[3],'price':row[4],'des':row[5],'qty':row[6],'image':row[7]}
					list.append(w)
	
	return render(request,'facetsearch.html',{'list':list,})'''
def dynamicfacetsearch(request):
	cursor=connection.cursor()
	#search=request.GET['s11']
	list=[]
	sql2="select distinct(fname) from facet where  uid='%s' " %(request.session['uid'])
	cursor.execute(sql2)
	result2=cursor.fetchall()
	pro=[]
	m=[]
	for row2 in result2:
		pro.append(row2[0])
	for i in pro:
		value=[]
		s="select fvalue from facet where  uid='%s' and fname='%s'" %(request.session['uid'],i)
		cursor.execute(s)
		f2=cursor.fetchall()
		for r1 in f2:
				value.append(r1[0])
		dic={i:value}
		m.append(dic)
		#print(" m=", m)
		for r2 in value:
				s3="select count from facet where  uid='%s' and fname='%s' and fvalue='%s'" %(request.session['uid'],i,r2)
				cursor.execute(s3)
				f3=cursor.fetchall()
				for r3 in f3:
					fcount=r3[0]
					print("fcount=",fcount)
					print("len=",len(value))
					disjo=float(fcount)/float(len(value))
					print disjo
					dis="update facet set disjiontpro='%f' where uid='%s'and fname='%s' and fvalue='%s'" %(disjo,request.session['uid'],i,r2)
					cursor.execute(dis)
					print dis
		s="select sum(disjiontpro) from facet where  uid='%s' and fname='%s'" %(request.session['uid'],i)
		cursor.execute(s)
		f4=cursor.fetchall()
		for r4 in f4:
				pscore=r4[0]
		s7="select property from propertytbl where  uid='%s' and property='%s'" %(request.session['uid'],i)
		cursor.execute(s7)
		f2=cursor.fetchall()
		if(cursor.rowcount>0):
			yu="update propertytbl set pscore='%s' where uid='%s'and property='%s'" %(pscore,request.session['uid'],i)
			cursor.execute(yu)
		else:
			ps="insert into propertytbl(pscore,uid,property) values ('%s','%s','%s')" %(pscore,request.session['uid'],i)
			cursor.execute(ps)
			
	list=[]
	itemid=[]
	s8="select property from propertytbl where  uid='%s' order by pscore desc" %(request.session['uid'])
	cursor.execute(s8)
	f8=cursor.fetchall()
	for r8 in f8:
		sql2="select fvalue from facet where disjiontpro=(select  max(disjiontpro) from facet where  uid='%s' and fname='%s')" %(request.session['uid'],r8[0])
		cursor.execute(sql2)
		#return HttpResponse(sql2)
		result2=cursor.fetchall()
		for row2 in result2:
			sql3="select itemid from featuretbl  where  fname='%s' and fvalue='%s' " %(r8[0],row2[0])
			cursor.execute(sql3)
			result3=cursor.fetchall()
			for row3 in result3:
				if row3[0]  not in itemid :
					itemid.append(row3[0])
	for item in itemid:			
		sql4="select * from item1 where  itemid='%s' " %(item)
		cursor.execute(sql4)
		result4=cursor.fetchall()
		for row in result4:
			w={'itemid':row[0],'itemname':row[1],'ccode':row[2],'bid':row[3],'price':row[4],'des':row[5],'qty':row[6],'image':row[7]}
			list.append(w)
	return render(request,'facetsearch.html',{'list':list,})
		
	return HttpResponse(pro)
	#return render(request,'facetsearch.html',{'list':list,})
def filter(request):
		cursor=connection.cursor()
		f="select distinct(fname)from facet where uid='%s' " %(request.session['uid'])
		cursor.execute(f)
		f1=cursor.fetchall()
		fe=[]
		f1e=[]
		for r in f1:
			f3="select distinct(fvalue) from facet where uid='%s'and fname='%s'" %(request.session['uid'],r[0])
			cursor.execute(f3)
			f2=cursor.fetchall()
			for r1 in f2:
				wf1={'fname':r[0].upper(),'fvalue':r1[0].upper()}
				f1e.append(wf1)
			de={'fname':r[0].upper()}
			fe.append(de)
		return render(request,'filter.html',{'f':fe,'f1':f1e})
def filterdelete(request):
		cursor=connection.cursor()
		fn=request.GET['fname']
		fv=request.GET['fvalue']
		f="delete from facet   where uid='%s' and fname='%s' and fvalue='%s' " %(request.session['uid'],fn,fv)
		cursor.execute(f)
		h="<script> alert('Removed');window.location='/filter/'</script>"
		return HttpResponse(h)
def filterdelete1(request):
		cursor=connection.cursor()
		fn=request.GET['fname']
		#fv=request.GET['fvalue']
		f="delete from facet   where uid='%s' and fname='%s'  " %(request.session['uid'],fn)
		cursor.execute(f)
		h="<script> alert('Removed');window.location='/filter/'</script>"
		return HttpResponse(h)
def dynsearch(request):
	cursor=connection.cursor()
	#search=request.GET['s11']
	search=request.GET['s11']
	sql2="Select distinct a.itemid , a.*  from item1 a left join featuretbl b  on a.itemid = b.itemid where LOWER(CONCAT(a.ccode,' ',a.bname,' ',b.fname,' ' ,b.fvalue )) LIKE LOWER( '%%%s%%' ) " %(search)
	cursor.execute(sql2)
	list=[]
	result4=cursor.fetchall()
	for row in result4:
		w={'itemid':row[1],'itemname':row[2],'ccode':row[3],'bid':row[4],'price':row[5],'des':row[6],'qty':row[7],'image':row[8]}
		list.append(w)
	return render(request,'feaserch.html',{'list':list})
def searchwlogin(request):
	cursor=connection.cursor()
	#search=request.GET['s11']
	search=request.GET['Search']
	sql2="Select distinct a.itemid , a.*  from item1 a left join featuretbl b  on a.itemid = b.itemid where LOWER(CONCAT(a.ccode,' ',a.bname,' ',b.fname,' ' ,b.fvalue )) LIKE LOWER( '%%%s%%' ) " %(search)
	cursor.execute(sql2)
	list=[]
	result4=cursor.fetchall()
	for row in result4:
		w={'itemid':row[1],'itemname':row[2],'ccode':row[3],'bid':row[4],'price':row[5],'des':row[6],'qty':row[7],'image':row[8]}
		list.append(w)
	return render(request,'searchitem.html',{'list':list})
def product_search_user(request):
	cursor=connection.cursor()
	id=request.GET['id']
	#uid=request.session['uid']
	sql="select * from item1 where itemid='%s'" %(id)
	cursor.execute(sql)
	result=cursor.fetchall()
	list=[]
	for row in result:
		w={'itemid':row[0],'itemname':row[1],'ccode':row[2],'bid':row[3],'price':row[4],'des':row[5],'qty':row[6],'image':row[7]}
		list.append(w)
	sql2="select * from featuretbl where itemid='%s'" %(id)
	cursor.execute(sql2)
	result1=cursor.fetchall()
	f=[]
	for row1 in result1:
		w={'itemid':row1[0],'fname':row1[1],'fvalue':row1[2],'fid':row1[3]}
		f.append(w)
	return render(request,'product_search_user.html',{'list':list,'f':f})

