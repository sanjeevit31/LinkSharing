package linksharing

import java.text.SimpleDateFormat

class LinksharingTagLib {
    static defaultEncodeAs = 'html'
    static  namespace = "ls"
    //static encodeAsForTags = [tagName: 'raw']
    def date={attrs,body->
        SimpleDateFormat sdf = new SimpleDateFormat(attrs.format);
        String date = sdf.format(attrs.value);
        out << date
    }
}
