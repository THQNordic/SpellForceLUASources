-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 326.409729 , 217.535858 , 19.304085 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 324.437469 , 213.554504 , 19.304085 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 323.044098 , 210.901611 , 19.304085 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 321.698517 , 208.486832 , 19.304085 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 5.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
