-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 206.611618 , 321.688141 , 23.126194 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(7211);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.4);]] )
   Camera:MotionSpline_AddSplinePoint( 203.682922 , 321.477814 , 23.736195 , 6.599996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 201.208389 , 324.232574 , 23.996195 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 199.201462 , 326.852386 , 24.015221 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
