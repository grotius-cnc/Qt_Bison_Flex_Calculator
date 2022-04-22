#include "testparser.h"

#include <QDebug>

#include "parser.h"
#include "scanner.h"

extern elements_t parsedElements;

YYBufferGuard::YYBufferGuard(YY_BUFFER_STATE* state) :
    mState(state)
{
}

YYBufferGuard::~YYBufferGuard() {
    yy_delete_buffer(*mState);
}


TestParser::TestParser(QByteArray data) :
    mElements()
{
    YY_BUFFER_STATE buffer = yy_scan_string(data.constData());
    YYBufferGuard guard(&buffer);
    Q_UNUSED(guard)

    int retcode;
    try {
        retcode = yyparse();
    } catch(ParserException& e) {
        qWarning() << QString("Parse error near line %1: %2").arg(e.lineNumber).arg(e.what).toUtf8().constData();
        retcode = 1;
    }

    if (retcode == 0) {
        qDebug() << "Successfully parsed" << parsedElements.count() << "elements";
        mElements.swap(parsedElements);
    }
}

elements_t& TestParser::elements()
{
    return mElements;
}
