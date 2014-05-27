    File outputFile=new File("/home/dheerajmadaan/GoovyExcercise_2April/output.txt")
    
    new File("/home/dheerajmadaan/GoovyExcercise_2April/Test").eachFile() { file->  
       file.eachLine{
       outputFile.withWriterAppend('ISO8859-1') { writer ->
        writer << it << "\n"
       
        }
       }
    }  