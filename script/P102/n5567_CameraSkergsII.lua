-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 56.388996 , 102.100624 , 9.428574 , 17.200029 , [[Camera:ScriptSplineLookAtNpc(5567);
Camera:ScriptSplineAddTargetLookAtOffset(5,0,0.5);]] )
   Camera:MotionSpline_AddSplinePoint( 55.680241 , 101.395172 , 9.428573 , 11.400007 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 55.680241 , 101.395172 , 9.428573 , 17.100029 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 55.680241 , 101.395172 , 9.428573 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
