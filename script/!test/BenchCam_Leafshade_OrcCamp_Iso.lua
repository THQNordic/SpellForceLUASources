-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 406.227081 , 474.369354 , 59.166401 , 29.900078 , [[Camera:ScriptSplineLookAtSpline();
Camera:ScriptSplineAddTargetLookAtOffset(0,0,-2);]] )
   Camera:MotionSpline_AddSplinePoint( 475.800659 , 465.076904 , 59.566399 , 9.700001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 518.157288 , 432.313660 , 61.609062 , 14.700020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 547.165405 , 399.836548 , 62.336227 , 20.400042 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 579.214417 , 357.362396 , 62.226402 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 632.423401 , 336.662323 , 60.756393 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.820313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
