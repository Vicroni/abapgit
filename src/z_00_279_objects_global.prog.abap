*&---------------------------------------------------------------------*
*& Report z_00_279_objects_global
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_00_279_objects_global.

DATA: r_plane       TYPE REF TO zcl_00_airplane_279,
      it_plane_list TYPE TABLE OF REF TO zcl_00_airplane_279.

START-OF-SELECTION.
  CREATE OBJECT r_plane.
  r_plane->set_attributes(
    EXPORTING
      im_name      = 'Hamburg'
      im_planetype = 'Boeing 737' ).
  APPEND r_plane TO it_plane_list.

  CREATE OBJECT r_plane.
  r_plane->set_attributes(
    EXPORTING
      im_name      = 'Munich'
      im_planetype = 'Airbus 380' ).
  APPEND r_plane TO it_plane_list.

  LOOP AT it_plane_list INTO r_plane.
    r_plane->get_attributes( ).
  ENDLOOP.

  DATA lv_no_of_planes TYPE i.

  CALL METHOD zcl_00_airplane_279=>get_no_of_planes
    IMPORTING
      no_of_planes = lv_no_of_planes.

  WRITE: / 'Number of planes: ', lv_no_of_planes.
