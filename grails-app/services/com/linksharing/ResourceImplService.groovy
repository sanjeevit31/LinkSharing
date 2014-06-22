package com.linksharing

import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.servlet.ServletContext
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import java.text.SimpleDateFormat

@Transactional
class ResourceImplService {
    Map map=[:];
    def serviceMethod() {

    }
  public Map upload(ServletContext servletContext,HttpServletRequest request,String type,long topicId){
      String filePath=''
      try{
          CommonsMultipartFile commonsMultipartFile= request.getFile('url_path')
          String topicName= Topic.findById(topicId).name
          String contextpath= servletContext.getRealPath(request.getContextPath())
          SimpleDateFormat dd=new SimpleDateFormat('ddMMyyyyHHmmss')
          String date=dd.format(new Date())
          File file=new File(contextpath+File.separator+'ResourcesImg'+File.separator+topicName+File.separator+date+commonsMultipartFile.originalFilename)
          file.mkdirs()
          commonsMultipartFile.transferTo(file)
          file.createNewFile()
          filePath = file.getAbsolutePath()

      }
      catch (Exception e){
        println 'from exception of upload'
      }

    return filePath

  }

    public  void resourceList(Object params,User newser,StringBuffer requestUrl){

        String applicationContext    = HelpUtil.getApplicationContext(requestUrl)
        params.appContext   =   applicationContext;
        def topic =   Topic.load(params.topicid)
        println topic
        List resourceList =  Resource.findAllByTopic(topic)
        def readStatusList=ResourceReadUnreadStatus.createCriteria().list {
                      inList('resource',resourceList)
                     and{
                            eq('user',user)
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
       List user=User.list()
       println resourceInstance
       user.each {
           ResourceReadUnreadStatus resourceReadUnreadStatus=new ResourceReadUnreadStatus()
           resourceReadUnreadStatus.user=it
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
        resourceReadUnreadStatus.user=User.get(params.userId)
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



