-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 653.929565 , 559.626221 , 9.146692 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(11541);
Camera:ScriptSplineModifyCursorSpeedModifier(0.1);]] )
   Camera:MotionSpline_AddSplinePoint( 652.339661 , 570.223022 , 10.416496 , 2.700000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 650.169495 , 580.460022 , 12.289577 , 5.999997 , [[Camera:ScriptSplineModifyCursorSpeedModifier(1);]] )
   Camera:MotionSpline_AddSplinePoint( 644.562927 , 605.396057 , 19.356499 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 639.369019 , 628.149902 , 23.783325 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 7.000000 )
   Camera:MotionSpline_SetCorrection( 0.820313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
