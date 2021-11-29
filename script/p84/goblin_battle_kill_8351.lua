-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 159.140656 , 124.283218 , 15.422907 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(162.230,128.404,10);]] )
   Camera:MotionSpline_AddSplinePoint( 159.140656 , 124.283211 , 15.422907 , 9.900002 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 159.140656 , 124.283211 , 15.422907 , 9.900002 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 159.140656 , 124.283211 , 15.422907 , 9.900002 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
