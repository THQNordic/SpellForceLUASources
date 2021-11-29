-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 323.544403 , 192.107086 , 17.832085 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(314.999,191.799,17.020);]] )
   Camera:MotionSpline_AddSplinePoint( 322.009125 , 192.207962 , 17.832085 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 320.630920 , 192.298523 , 17.832085 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 318.730957 , 192.357971 , 17.832085 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
