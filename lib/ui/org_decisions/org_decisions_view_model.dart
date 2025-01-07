import 'package:flutter/material.dart';

class OrgDecisionsViewModel extends ChangeNotifier {

  final List<Decision> decisions = [
    Decision(
      date: "2024-12-29",
      name: "جهاد احمد مصطفى حج علي",
      subject: "ترخيص مظلات + افراز شقق",
      decision: "الموافقة على الترخيص وافراز البناء القائم",
      reference: "A/1/94+93 بيت وزن",
      requestNumber: "697493",
    ),
    Decision(
      date: "2024-12-29",
      name: "نبيل عبد الرحيم فايز سعد",
      subject: "اذن اشغال لغاية اضافه كهرباء اضافه غاز",
      decision: "الموافقة على الطلب",
      reference: "33 عصيره الشمالية 22",
      requestNumber: "702044",
    ),
    Decision(
      date: "2024-12-28",
      name: "سامي محمود عبد الله",
      subject: "تصريح بناء طابق اضافي",
      decision: "الموافقة مع شرط الالتزام بالمخطط",
      reference: "شارع القدس/ الحي الجنوبي",
      requestNumber: "580129",
    ),
    Decision(
      date: "2024-12-27",
      name: "هالة محمد فؤاد",
      subject: "إذن اشغال محل تجاري",
      decision: "موافقة مبدئية لحين توفير المستندات المطلوبة",
      reference: "ميدان التحرير/ عمارة رقم 5",
      requestNumber: "601983",
    ),
    Decision(
      date: "2024-12-27",
      name: "عبد الكريم سامي سعيد",
      subject: "طلب تقوية أسوار الحديقة",
      decision: "رفض الطلب بسبب المخالفة التنظيمية",
      reference: "حي الزيتون",
      requestNumber: "745320",
    ),
    Decision(
      date: "2024-12-26",
      name: "علي خالد محمود",
      subject: "طلب تعديل شبكة المياه",
      decision: "الموافقة بعد مراجعة تفاصيل الطلب",
      reference: "حي الرمال، شارع النصر",
      requestNumber: "692310",
    ),
    Decision(
      date: "2024-12-25",
      name: "إيمان أحمد خليل",
      subject: "ترخيص كراج خاص",
      decision: "موافقة مبدئية بانتظار فحص الموقع",
      reference: "طريق الساحل، بجانب مبنى رقم 12",
      requestNumber: "710432",
    ),
    Decision(
      date: "2024-12-24",
      name: "محمد يوسف علي",
      subject: "إذن تركيب لوحة إعلانية",
      decision: "الموافقة على اللوحة ضمن المعايير",
      reference: "دوار الشهداء",
      requestNumber: "658291",
    ),
    Decision(
      date: "2024-12-23",
      name: "نور الدين حسن جبر",
      subject: "طلب تغيير استخدام أرض زراعية",
      decision: "رفض الطلب بسبب قوانين الحماية الزراعية",
      reference: "أراضي وادي القمر",
      requestNumber: "620890",
    ),
    Decision(
      date: "2024-12-22",
      name: "محمود أحمد سليم",
      subject: "ترخيص مركز تدريب",
      decision: "موافقة نهائية بعد اكتمال جميع الأوراق",
      reference: "شارع فلسطين",
      requestNumber: "735221",
    ),
  ];

  OrgDecisionsViewModel();

}

class Decision {
  final String date;
  final String name;
  final String subject;
  final String decision;
  final String reference;
  final String requestNumber;

  Decision({
    required this.date,
    required this.name,
    required this.subject,
    required this.decision,
    required this.reference,
    required this.requestNumber,
  });
}
