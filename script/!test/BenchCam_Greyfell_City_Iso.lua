-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 561.657471 , 222.139542 , 85.501076 , 0.000000 , [[Camera:ScriptSplineLookAtSpline();
Camera:ScriptSplineAddTargetLookAtOffset(0,0,-4);]] )
   Camera:MotionSpline_AddSplinePoint( 578.241577 , 242.954651 , 90.190887 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 599.337036 , 264.050995 , 88.201241 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 616.212097 , 285.146881 , 85.521118 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 628.865784 , 310.379944 , 85.492882 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 611.991394 , 323.116730 , 89.221054 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 590.896240 , 339.990051 , 90.921112 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 565.732361 , 365.154755 , 86.701111 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 544.658386 , 390.446991 , 85.541405 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 569.940735 , 407.342957 , 88.460258 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 599.481506 , 432.652893 , 85.611115 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
