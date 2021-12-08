import 'package:flutter/material.dart';

class CashData {
  final String? image, title, description, type, date;
  final int? price, size, id;
  final Color? color;
  CashData({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.type,
    this.date,
    this.size,
    this.color,
  });
}

List<CashData> cashData = [
  CashData(
    id: 1,
    title: '회원가입(추천인)',
    price: 500,
    type: '적립',
    date: '2021.07.24',
    size: 12,
    description: '한가람 미술관',
    image: 'assets/images/product/secretImage@3x.png',
    color: Color(0xFF3D82AE),
  ),
  CashData(
    id: 2,
    title: '데일리케어',
    price: 300,
    type: '적립',
    date: '2021.07.25',
    size: 8,
    description: '비타민 스테이션',
    image: 'assets/images/product/radioBeatImage@3x.png',
    color: Color(0xFFD3A984),
  ),
  CashData(
    id: 3,
    title: '상품구매',
    price: 200,
    type: '사용',
    date: '2021.07.26',
    size: 12,
    description: '헤라 스킨케어 세트 외 01건',
    image: 'assets/images/product/1000years.png',
    color: Color(0xFF3D82AE),
  ),
  CashData(
    id: 4,
    title: '데일리케어',
    price: 100,
    type: '적립',
    date: '2021.07.27',
    size: 8,
    description: '비타민 스테이션',
    image: 'assets/images/product/dancing.png',
    color: Color(0xFFD3A984),
  ),
  CashData(
    id: 5,
    title: '리뷰작성',
    price: 500,
    type: '적립',
    date: '2021.07.28',
    size: 12,
    description: '송도스마트밸리',
    image: 'assets/images/product/earth.png',
    color: Color(0xFF3D82AE),
  ),
  CashData(
    id: 6,
    title: '게시물작성',
    price: 100,
    type: '적립',
    date: '2021.07.29',
    size: 8,
    description: '비타민 스테이션',
    image: 'assets/images/product/hangeul_image.png',
    color: Color(0xFFD3A984),
  ),
  CashData(
    id: 7,
    title: '상품구매',
    price: 200,
    type: '사용',
    date: '2021.07.30',
    size: 12,
    description: '헤라 스킨케어 세트 외 01건',
    image: 'assets/images/product/secretImage@3x.png',
    color: Color(0xFF3D82AE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
