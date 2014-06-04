package com.linksharing

import grails.transaction.Transactional
import org.apache.tomcat.jni.Procattr
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.servlet.ServletContext
import javax.servlet.ServletOutputStream
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import java.text.SimpleDateFormat

@Transactional
class ResourceImplService {
    Map map=[:];
    def serviceMethod() {

    }
  public Map upload(ServletContext servletContext,HttpServletRequest request,String type,GrailsParameterMap params){
      try{
          CommonsMultipartFile commonsMultipartFile= request.getFile('url_path')
          println commonsMultipartFile.contentType
          println commonsMultipartFile.empty
          println commonsMultipartFile.name   //url_path
          println commonsMultipartFile.originalFilename//imgae name
          println commonsMultipartFile.size
          println   request.getContextPath()
         String topicName= Topic.findById(params.topic.id).name
          String contextpath= servletContext.getRealPath(request.getContextPath())

          SimpleDateFormat dd=new SimpleDateFormat('ddMMyyyyHHmmss')
          String str=dd.format(new Date())
          println str
          File file=new File(contextpath+File.separator+'ResourcesImg'+File.separator+topicName+File.separator+str+commonsMultipartFile.originalFilename)
          println file.getAbsolutePath()
          println    file.mkdirs()
          commonsMultipartFile.transferTo(file)

          println      file.createNewFile()
          println file

          params.url_path=file.getAbsolutePath()

      }
      catch (Exception e){
        println 'from exception of upload'
      }



     map

  }

    public  void resourceList(Object params,NewUser newser){
        def topic =   Topic.load(params.topicid)
        println topic
        List resourceList =  Resource.findAllByTopic(topic)
        def readStatusList=ResourceReadUnreadStatus.createCriteria().list {
                      inList('resource',resourceList)
                     and{
                            eq('users',newser)
                      }
              }
        println readStatusList.size()+'..................................................................'
        List read=[]
        List readd=[]

        readStatusList.each {it->
           readd.add(it.resource.id)
        }

        resourceList.each {it->
            read.add(readd.contains(it.id))
        }
        params.resourceList=resourceList
        params.readStatusList=readStatusList
        params.read=read


    }

   public void readWriteEntryForResource1(Resource resourceInstance){
       List newUser=NewUser.list()
       println resourceInstance
       newUser.each {
           ResourceReadUnreadStatus resourceReadUnreadStatus=new ResourceReadUnreadStatus()
           resourceReadUnreadStatus.users=it
           resourceReadUnreadStatus.resource=resourceInstance
           resourceReadUnreadStatus.status='N'
           try{
               resourceReadUnreadStatus.save(failOnError: true)

           }
           catch(Exception e){
               println e
           }

       }

    }


    public void readWriteEntryForResource(Object params){
        ResourceReadUnreadStatus resourceReadUnreadStatus=  new ResourceReadUnreadStatus()
        resourceReadUnreadStatus.users=NewUser.findByEmailid(params.user)
        resourceReadUnreadStatus.resource=Resource.findById(params.resourceId)
        resourceReadUnreadStatus.readDate=new Date()
        resourceReadUnreadStatus.status='Yes'
        resourceReadUnreadStatus.save()
        }

   public Map download(Object params,HttpServletResponse response){
       println params
       String path=params.path
       def file = new File(path)
       if (file.exists()) {
           println 'from download2'
           response.setContentType("application/octet-stream") // or or image/JPEG or text/xml or whatever type the file is
           response.setHeader("Content-disposition", "attachment;filename=\"${file.name}\"")
           response.outputStream << file.bytes
           [success:'success']
    }


    }

    }



