// Generated by gencpp from file planner/AddTwoInts.msg
// DO NOT EDIT!


#ifndef PLANNER_MESSAGE_ADDTWOINTS_H
#define PLANNER_MESSAGE_ADDTWOINTS_H

#include <ros/service_traits.h>


#include <planner/AddTwoIntsRequest.h>
#include <planner/AddTwoIntsResponse.h>


namespace planner
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
} // namespace planner


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::planner::AddTwoInts > {
  static const char* value()
  {
    return "6a2e34150c00229791cc89ff309fff21";
  }

  static const char* value(const ::planner::AddTwoInts&) { return value(); }
};

template<>
struct DataType< ::planner::AddTwoInts > {
  static const char* value()
  {
    return "planner/AddTwoInts";
  }

  static const char* value(const ::planner::AddTwoInts&) { return value(); }
};


// service_traits::MD5Sum< ::planner::AddTwoIntsRequest> should match
// service_traits::MD5Sum< ::planner::AddTwoInts >
template<>
struct MD5Sum< ::planner::AddTwoIntsRequest>
{
  static const char* value()
  {
    return MD5Sum< ::planner::AddTwoInts >::value();
  }
  static const char* value(const ::planner::AddTwoIntsRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::planner::AddTwoIntsRequest> should match
// service_traits::DataType< ::planner::AddTwoInts >
template<>
struct DataType< ::planner::AddTwoIntsRequest>
{
  static const char* value()
  {
    return DataType< ::planner::AddTwoInts >::value();
  }
  static const char* value(const ::planner::AddTwoIntsRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::planner::AddTwoIntsResponse> should match
// service_traits::MD5Sum< ::planner::AddTwoInts >
template<>
struct MD5Sum< ::planner::AddTwoIntsResponse>
{
  static const char* value()
  {
    return MD5Sum< ::planner::AddTwoInts >::value();
  }
  static const char* value(const ::planner::AddTwoIntsResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::planner::AddTwoIntsResponse> should match
// service_traits::DataType< ::planner::AddTwoInts >
template<>
struct DataType< ::planner::AddTwoIntsResponse>
{
  static const char* value()
  {
    return DataType< ::planner::AddTwoInts >::value();
  }
  static const char* value(const ::planner::AddTwoIntsResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // PLANNER_MESSAGE_ADDTWOINTS_H