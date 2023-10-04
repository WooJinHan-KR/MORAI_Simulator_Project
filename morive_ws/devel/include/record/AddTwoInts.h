// Generated by gencpp from file record/AddTwoInts.msg
// DO NOT EDIT!


#ifndef RECORD_MESSAGE_ADDTWOINTS_H
#define RECORD_MESSAGE_ADDTWOINTS_H

#include <ros/service_traits.h>


#include <record/AddTwoIntsRequest.h>
#include <record/AddTwoIntsResponse.h>


namespace record
{

struct AddTwoInts
{

typedef AddTwoIntsRequest Request;
typedef AddTwoIntsResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct AddTwoInts
} // namespace record


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::record::AddTwoInts > {
  static const char* value()
  {
    return "6a2e34150c00229791cc89ff309fff21";
  }

  static const char* value(const ::record::AddTwoInts&) { return value(); }
};

template<>
struct DataType< ::record::AddTwoInts > {
  static const char* value()
  {
    return "record/AddTwoInts";
  }

  static const char* value(const ::record::AddTwoInts&) { return value(); }
};


// service_traits::MD5Sum< ::record::AddTwoIntsRequest> should match
// service_traits::MD5Sum< ::record::AddTwoInts >
template<>
struct MD5Sum< ::record::AddTwoIntsRequest>
{
  static const char* value()
  {
    return MD5Sum< ::record::AddTwoInts >::value();
  }
  static const char* value(const ::record::AddTwoIntsRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::record::AddTwoIntsRequest> should match
// service_traits::DataType< ::record::AddTwoInts >
template<>
struct DataType< ::record::AddTwoIntsRequest>
{
  static const char* value()
  {
    return DataType< ::record::AddTwoInts >::value();
  }
  static const char* value(const ::record::AddTwoIntsRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::record::AddTwoIntsResponse> should match
// service_traits::MD5Sum< ::record::AddTwoInts >
template<>
struct MD5Sum< ::record::AddTwoIntsResponse>
{
  static const char* value()
  {
    return MD5Sum< ::record::AddTwoInts >::value();
  }
  static const char* value(const ::record::AddTwoIntsResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::record::AddTwoIntsResponse> should match
// service_traits::DataType< ::record::AddTwoInts >
template<>
struct DataType< ::record::AddTwoIntsResponse>
{
  static const char* value()
  {
    return DataType< ::record::AddTwoInts >::value();
  }
  static const char* value(const ::record::AddTwoIntsResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // RECORD_MESSAGE_ADDTWOINTS_H