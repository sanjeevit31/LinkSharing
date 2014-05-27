package com.linksharing

import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.servlet.ServletContext
import javax.servlet.http.HttpServletRequest
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
    public  void resourceList(Object params){
        def topic =   Topic.load(params.topicid)
        println topic
      List resourceList =  Resource.findAllByTopic(topic)
//        ResourceReadUnreadStatus.findAllByUsersAndResource
        
        params.resourceList=resourceList

    }

   public void readWriteEntryForResource(Resource resourceInstance){
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

}
